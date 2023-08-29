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
    TypeText                          Phone                    +917398867459
    Picklist                          Salutation               Mr.
    TypeText                          First Name               tara srinivas20
    TypeText                          Last Name                chandika
    ComboBox                          Search Accounts...       Dickenson plc
    TypeText                          Email                    tvsh@gmail.com
    TypeText                          Title                    project20
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
    TypeText                          Fax                      7398878560
    PickList                          Lead Source              Web
    TypeText                          Home Phone               8987
    ClickText                         Birthdate                anchor=Home Phone
    DropDown                          Pick a Year              1979
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                                                  20
    TypeText                          Other Phone              987946
    TypeText                          Department               tesing department
    TypeText                          Assistant                no assistant
    TypeText                          Asst. Phone              00000034
    TypeText                          Description              learning copado robotic testing
    ClickText                         Save                     partial_match=False
    UseModal                          Off
    ClickText                         Details
    
