*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
test amazon
    Open Browser    https://www.facebook.com    browser=firefox    executable_path=/usr/bin/firefox
    Maximize Browser Window
    Wait Until Element Is Visible    id=nav-logo-sprites    15s
    Manage_Coukies
    Condition_get_galery           
*** Variables ***
${hint}    id=sp-cc-accept
*** keywords ***
Manage_Coukies
    ${accept_cookies}=    Run Keyword And Return Status    Page Should Contain Button    ${hint} 
    Run Keyword If  ${accept_cookies}  Click Button    ${hint}
    
Condition_get_galery
    ${cuisine_et_maison1}    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains (text(), 'Cuisine et maison')]
    ${cuisine_et_maison2}    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[@alt='Maison et cuisine']        
    IF    ${cuisine_et_maison1}
        Click Element    xpath=//*[contains (text(), 'Cuisine et maison')]
    ELSE IF    ${cuisine_et_maison2}
        Click Element    xpath=//*[@alt='Maison et cuisine']
    ELSE
        Click Element    xpath=//*[@alt='Cuisine']
    END
     
    
