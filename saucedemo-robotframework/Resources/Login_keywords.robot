*** Settings ***
Documentation    Keywords for Login module
Library          SeleniumLibrary
Resource         ../Resources/Login_variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    

Verify Login Page Elements
    Title Should Be    ${TITLE_LOGIN}
    Element Should Be Visible    ${INPUT_USERNAME}
    Element Should Be Visible    ${INPUT_PASSWORD}
    Element Should Be Visible    ${BTN_LOGIN}

Input Username
    [Arguments]    ${username}
    Clear Element Text    ${INPUT_USERNAME}
    Input Text    ${INPUT_USERNAME}    ${username}

Input Password
    [Arguments]    ${password}
    Clear Element Text    ${INPUT_PASSWORD}
    Input Text    ${INPUT_PASSWORD}    ${password}

Click Login Button
    Click Button    ${BTN_LOGIN}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

Verify Login Success
    Wait Until Element Is Visible    css=.title    
    Element Text Should Be    css=.title    ${TITLE_PRODUCTS}

Verify Error Message
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    
    Element Text Should Be    ${ERROR_MESSAGE}    ${expected_error}


