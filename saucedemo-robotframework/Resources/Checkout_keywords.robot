*** Settings ***
Documentation    Keywords for Checkout module
Library          SeleniumLibrary
Resource         ../Resources/Checkout_variables.robot
Resource         ../Resources/Inventory_variables.robot

*** Keywords ***
Go To Shopping Cart
    Click Element    ${BTN_SHOPPING_CART}
    Wait Until Element Is Visible    ${CART_TITLE}    

Verify Your Cart Page Elements
    Element Text Should Be      ${CART_TITLE}           ${TITLE_YOUR_CART}
    Element Should Be Visible   ${BTN_MENU}
    Element Should Be Visible   ${CART_ITEM_NAME}
    Element Should Be Visible   ${CART_QUANTITY}
    Element Should Be Visible   ${CART_ITEM_DESC}
    Element Should Be Visible   ${CART_ITEM_PRICE}
    Element Should Be Visible   ${BTN_REMOVE_CART}
    Element Should Be Visible   ${BTN_CONTINUE_SHOPPING}
    Element Should Be Visible   ${BTN_CHECKOUT}

Click Cart Item Name Link
    Click Element    ${CART_ITEM_NAME}
    Wait Until Element Is Visible    ${BTN_BACK_TO_PRODUCTS}    

Remove Item From Cart Page
    Click Element    ${BTN_REMOVE_CART}
    Wait Until Element Is Not Visible    ${CART_ITEM}    

Verify Item Not Visible In Cart
    Element Should Not Be Visible    ${CART_ITEM}

Click Continue Shopping
    Click Element    ${BTN_CONTINUE_SHOPPING}
    Wait Until Element Is Visible    css=.title    

Click Checkout Button
    Click Element    ${BTN_CHECKOUT}
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}   

Verify Checkout Info Page Elements
    Element Text Should Be      ${CART_TITLE}           ${TITLE_CHECKOUT_INFO}
    Element Should Be Visible   ${INPUT_FIRST_NAME}
    Element Should Be Visible   ${INPUT_LAST_NAME}
    Element Should Be Visible   ${INPUT_POSTAL_CODE}
    Element Should Be Visible   ${BTN_CANCEL_INFO}
    Element Should Be Visible   ${BTN_CONTINUE}

Input Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Run Keyword If    '${first_name}' != '${EMPTY}'    Input Text    ${INPUT_FIRST_NAME}    ${first_name}
    Run Keyword If    '${last_name}' != '${EMPTY}'     Input Text    ${INPUT_LAST_NAME}     ${last_name}
    Run Keyword If    '${postal_code}' != '${EMPTY}'   Input Text    ${INPUT_POSTAL_CODE}   ${postal_code}

Click Continue Button
    Click Element    ${BTN_CONTINUE}

Click Cancel On Info Page
    Click Element    ${BTN_CANCEL_INFO}
    Wait Until Element Is Visible    ${CART_TITLE}    

Verify Checkout Error Message
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${ERROR_MESSAGE_CHECKOUT}    
    Element Text Should Be    ${ERROR_MESSAGE_CHECKOUT}    ${expected_error}

Verify Checkout Overview Page Elements
    Wait Until Element Is Visible    ${OVERVIEW_TITLE}   
    Element Text Should Be           ${OVERVIEW_TITLE}    ${TITLE_CHECKOUT_OVERVIEW}
    Element Should Be Visible        ${OVERVIEW_ITEM_NAME}
    Element Should Be Visible        ${OVERVIEW_QUANTITY}
    Element Should Be Visible        ${OVERVIEW_ITEM_PRICE}
    Element Should Be Visible        ${PAYMENT_INFO}
    Element Should Be Visible        ${SHIPPING_INFO}
    Element Should Be Visible        ${PRICE_TOTAL}
    Element Should Be Visible        ${BTN_CANCEL_OVERVIEW}
    Element Should Be Visible        ${BTN_FINISH}

Click Overview Item Name Link
    Click Element    ${OVERVIEW_ITEM_NAME}
    Wait Until Element Is Visible    ${BTN_BACK_TO_PRODUCTS}    

Click Cancel On Overview Page
    Click Element    ${BTN_CANCEL_OVERVIEW}
    Wait Until Element Is Visible    css=.title    
    Element Text Should Be    css=.title    Products

Click Finish Button
    Click Element    ${BTN_FINISH}
    Wait Until Element Is Visible    ${COMPLETE_HEADER}   

Verify Checkout Complete Page
    Element Text Should Be    ${OVERVIEW_TITLE}    ${TITLE_CHECKOUT_COMPLETE}
    Element Should Be Visible    ${COMPLETE_ICON}
    Element Text Should Be    ${COMPLETE_HEADER}    ${COMPLETE_HEADER_TEXT}
    Element Should Be Visible    ${BTN_BACK_HOME}

Click Back Home Button
    Click Element    ${BTN_BACK_HOME}
    Wait Until Element Is Visible    css=.title    
    Element Text Should Be    css=.title    Products
