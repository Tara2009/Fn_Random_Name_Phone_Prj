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


