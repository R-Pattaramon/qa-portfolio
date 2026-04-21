*** Settings ***
Documentation    Variables for Login module

*** Variables ***
${URL}                      https://www.saucedemo.com/
${BROWSER}                  chrome

# Valid credentials
${VALID_USERNAME}           standard_user
${VALID_PASSWORD}           secret_sauce

# Invalid credentials
${INVALID_USERNAME}         ยูเซอร์เนม
${INVALID_PASSWORD}         พาสเวิร์ด

# Wrong credentials
${WRONG_USERNAME}           testtest
${WRONG_PASSWORD}           test1234

# Locked user
${LOCKED_USERNAME}          locked_out_user

# Locators
${INPUT_USERNAME}           id=user-name
${INPUT_PASSWORD}           id=password
${BTN_LOGIN}                id=login-button
${ERROR_MESSAGE}            css=[data-test="error"]

# Expected values
${TITLE_LOGIN}              Swag Labs
${TITLE_PRODUCTS}           Products
${ERR_INVALID_CRED}         Epic sadface: Username and password do not match any user in this service
${ERR_USERNAME_REQUIRED}    Epic sadface: Username is required
${ERR_PASSWORD_REQUIRED}    Epic sadface: Password is required
${ERR_LOCKED_OUT}           Epic sadface: Sorry, this user has been locked out.
