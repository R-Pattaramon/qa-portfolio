*** Settings ***
Documentation    Common Keywords shared across all modules
Library          SeleniumLibrary
Resource         ../Resources/Login_variables.robot
Resource         ../Resources/Login_keywords.robot
Resource         ../Resources/Inventory_variables.robot
Resource         ../Resources/Inventory_keywords.robot
Resource         ../Resources/Checkout_variables.robot
Resource         ../Resources/Checkout_keywords.robot

*** Keywords ***
Setup Browser
    [Documentation]     ใช้สำหรับการเรียกเปิดเว็บไซต์
    [Arguments]         ${URL}        ${BROWSER}
    ${options}=         Evaluate
    ...    __import__('selenium.webdriver', fromlist=['ChromeOptions']).ChromeOptions()
    Evaluate    $options.add_argument('--incognito')
    Open Browser        ${URL}    ${browser}    options=${options}
    Maximize Browser Window
    Wait Until Page Contains      Swag Labs

Login As Standard User
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Login Success

Setup And Login
    Setup Browser    ${URL}    ${BROWSER}
    Login As Standard User

Add Backpack To Cart And Go To Cart
    Add To Cart Backpack From Product List
    Go To Shopping Cart

Complete Checkout Flow
    [Arguments]    ${first_name}=${FIRST_NAME}    ${last_name}=${LAST_NAME}    ${postal_code}=${POSTAL_CODE}
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Checkout Information    ${first_name}    ${last_name}    ${postal_code}
    Click Continue Button

  