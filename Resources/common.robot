*** Settings ***
Library                    QForce
Library                    String    

*** Variables ***
${Browser}                 Chrome
${username}                tarasrinivas50@Curious-goat-4kkext.com
${login_url}               https://curious-goat-4kkext-dev-ed.my.salesforce.com/
${home_url}                ${login_url}/lightning/page/home                   

*** Keywords ***
Setup Browser
    Set Library Search Order                QForce           QWeb
    Open Browser                            about:blank      ${Browser}
    SetConfig                               LineBreak        ${Empty}
    SetConfig                               DefaultTimeout   20s
    Evaluate                                random.seed()    random        #random generator

End Suite
    Close All Browsers

Login
    [Documentation]                Login into Salesforce Instance
    GoTo                           ${login_url}
    TypeText                       Username                        ${username}            delay=1
    TypeText                       Password                        ${password}
    ClickText                      Log In

Login As
    [Documentation]       Login As different persona. User needs to be logged into Salesforce with Admin rights
    ...                   before calling this keyword to change persona.
    ...                   Example:
    ...                   LoginAs    Chatter Expert
    [Arguments]           ${persona}
    ClickText             Setup
    ClickText             Setup for current app
    SwitchWindow          NEW
    TypeText              Search Setup                ${persona}             delay=2
    ClickText             User                        anchor=${persona}      delay=5    # wait for list to populate, then click
    VerifyText            Freeze                      timeout=45                        # this is slow, needs longer timeout          
    ClickText             Login                       anchor=Freeze          delay=1      

Fill MFA
    ${mfa_code}=         GetOTP    ${username}   ${secret}   ${login_url}    
    TypeSecret           Verification Code       ${mfa_code}      
    ClickText            Verify 
    
Home
    [Documentation]                Navigate to homepage, login if needed
    GoTo                           ${home_url}
    ${login_status}=               IsText                                    2
    Run Keyword If                 ${login_status}                           Login
    ClickText                      Home
    VerifyTitle                    Home | Salesforce

VerifyStage
    [Documentation]       Verifies that stage given in ${text} is at ${selected} state; either selected (true) or not selected (false)
    [Arguments]           ${text}                     ${selected}=true
    VerifyElement        //a[@title\="${text}" and (@aria-checked\="${selected}" or @aria-selected\="${selected}")]