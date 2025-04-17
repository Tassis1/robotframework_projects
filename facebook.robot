*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Creation compte facebook

    [Tags]  Facebook creation_de_compte sans_accepter_les_cookies

    Open Browser    https://www.facebook.com    browser=firefox    executable_path=/usr/bin/firefox
    ${Manage_cookies}=    Run Keyword And Ignore Error    Click Element   xpath=//span[text()='Decline optional cookies']
    Click Element   xpath=//a[contains(text(), 'Create new account')]
    ${Manage_cookies}=    Run Keyword And Ignore Error    Click Element   xpath=//span[text()='Decline optional cookies']
    log    remplir le formulaire
    Input Text      name=firstname      Test
    Input Text      name=lastname      Test
    Select From List By Label    id=month    Jan
    Select From List By value    id=day       1
    Select From List By value    id=year    2001
    Click Element    xpath=//Label[contains(text(), 'Male')]
    Input Text    name=reg_email__   07 07 07 07 07
    Input Text   id=password_step_input    Test2001
    Click Button    name=websubmit
    Page Should Contain    Please enter a valid mobile number or email address.

    Close Browser


