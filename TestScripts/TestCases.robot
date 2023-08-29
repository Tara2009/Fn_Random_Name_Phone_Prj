*** Settings ***
Resource            ../Resources/common.robot
Suite Setup         Setup Browser
Suite Teardown      End Suite

*** Test Cases ***
Contact Creation
    [Tags]                            Contact
    Appstate                          Home
    LaunchApp                         Sales
    ClickText                         Contacts
    ClickUntil                        New Contact              New
    UseModal                          On
    # generate random phone number, just as an example
    # NOTE: initialization of random number generator is done on suite setup
    ${rand_phone}=                    Generate Random String   10                          [NUMBERS]
    # concatenate leading "+" and random numbers
    ${phone}=                         SetVariable              ${rand_phone}
    TypeText                          Phone                    ${phone}                    
    Picklist                          Salutation               Mr.
    TypeText                          First Name               tara28
    TypeText                          Last Name                chandika
    ComboBox                          Search Accounts...       Dickenson plc
    TypeText                          Email                    tvsh@gmail.com
    TypeText                          Title                    project28
    TypeText                          Mailing Street           hanuman nagar 4th line
    TypeText                          Mailing City             guntur
    TypeText                          Mailing State/Province   ap
    TypeText                          Mailing Zip/Postal Code  522006
    TypeText                          Mailing Country          india
    TypeText                          Other Street             vijayapuri colony
    TypeText                          Other City               guntur
    TypeText                          Other State/Province     ap
    TypeText                          Other Zip/Postal Code    52206
    TypeText                          Other Country            india
    # Generate fox using Generate Random String function
    ${rand_fax}=                      Generate Random String   10                        [NUMBERS]
    ${fax}=                           SetVariable              ${rand_fax}                         
    TypeText                          Fax                      ${fax}
    PickList                          Lead Source              Web
    # Generate Home Phone using Generate Random String function
    ${rand_home}=                     Generate Random String   10                        [NUMBERS]
    ${Home phone}=                    SetVariable              ${rand_home}                               
    TypeText                          Home Phone               ${Home phone}
    ClickText                         Birthdate                anchor=Home Phone
    DropDown                          Pick a Year              1979
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                                                  20
    # Generate Other Phone using Generate Random String function
    ${rand_OthPhone}=                 Generate Random String   10                        [NUMBERS]
    ${OthPhone}=                      SetVariable              ${rand_OthPhone}                          }                            
    TypeText                          Other Phone              ${OthPhone}
    TypeText                          Department               tesing department
    TypeText                          Assistant                no assistant
    # Generate asst phone using Generate Random String function
    ${rand_asstphone}=                Generate Random String   10                        [NUMBERS]
    ${Asst Phone}=                    SetVariable              ${rand_asstphone}
    TypeText                          Asst. Phone              ${Asst Phone}
    # Generate mobile using Generate Random String function
    ${rand_mobile}=                   Generate Random String   10                        [NUMBERS]
    ${mobile}=                        SetVariable              ${rand_mobile}
    TypeText                          Mobile                   ${mobile}                   
    TypeText                          Description              learning copado robotic testing
    ClickText                         Save                     partial_match=False
    UseModal                          Off
    ClickText                         Details
    
