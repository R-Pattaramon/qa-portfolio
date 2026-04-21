*** Settings ***
Documentation    Keywords for Inventory (Product) module
Library          SeleniumLibrary
Library          Collections
Resource         ../Resources/Inventory_variables.robot
Resource         ../Resources/Login_variables.robot

*** Keywords ***
Verify Products Page Elements
    Wait Until Element Is Visible    css=.title    
    Element Text Should Be           css=.title    Products
    Element Should Be Visible        ${BTN_MENU}
    Element Should Be Visible        css=.shopping_cart_link
    Element Should Be Visible        ${DROPDOWN_SORT}
    Element Should Be Visible        ${PRODUCT_LIST}

Open Menu
    Click Element    ${BTN_MENU}
    Wait Until Element Is Visible    ${MENU_SIDEBAR}    

Close Menu
    Click Element    ${BTN_CLOSE_MENU}
    Wait Until Element Is Not Visible    ${MENU_SIDEBAR}    

Verify Menu Elements
    Element Should Be Visible    ${BTN_CLOSE_MENU}
    Element Should Be Visible    ${MENU_ALL_ITEMS}
    Element Should Be Visible    ${MENU_ABOUT}
    Element Should Be Visible    ${MENU_LOGOUT}
    Element Should Be Visible    ${MENU_RESET}

Click Menu All Items
    Click Element    ${MENU_ALL_ITEMS}
    Wait Until Element Is Visible    ${PRODUCT_LIST}    

Click Menu About
    Click Element    ${MENU_ABOUT}
    Wait Until Page Contains    Sauce Labs    

Click Menu Logout
    Click Element    ${MENU_LOGOUT}
    Wait Until Element Is Visible    ${INPUT_USERNAME}    

Click Menu Reset
    Click Element    ${MENU_RESET}
    Wait Until Element Is Visible    css=.title    

Select Sort Option
    [Arguments]    ${sort_value}
    Select From List By Value    ${DROPDOWN_SORT}    ${sort_value}
    Sleep    1s

Verify Sort Dropdown Options
    Element Should Be Visible    ${DROPDOWN_SORT}
    ${options}=    Get List Items    ${DROPDOWN_SORT}
    Should Contain    ${options}    Name (A to Z)
    Should Contain    ${options}    Name (Z to A)
    Should Contain    ${options}    Price (low to high)
    Should Contain    ${options}    Price (high to low)

Verify Products Sorted By Name A To Z
    ${names}=    Get WebElements    ${PRODUCT_NAME}
    ${name_list}=    Create List
    FOR    ${name}    IN    @{names}
        ${text}=    Get Text    ${name}
        Append To List    ${name_list}    ${text}
    END
    ${sorted_list}=    Copy List    ${name_list}
    Sort List    ${sorted_list}
    Lists Should Be Equal    ${name_list}    ${sorted_list}

Verify Products Sorted By Name Z To A
    ${names}=    Get WebElements    ${PRODUCT_NAME}
    ${name_list}=    Create List
    FOR    ${name}    IN    @{names}
        ${text}=    Get Text    ${name}
        Append To List    ${name_list}    ${text}
    END
    ${sorted_list}=    Copy List    ${name_list}
    Sort List    ${sorted_list}
    Reverse List    ${sorted_list}
    Lists Should Be Equal    ${name_list}    ${sorted_list}

Click Product Image Backpack
    Click Element    ${PRODUCT_IMAGE_BACKPACK}
    Wait Until Element Is Visible    ${BTN_BACK_TO_PRODUCTS}    

Click Product Name Backpack
    Click Element    ${PRODUCT_LINK_BACKPACK}
    Wait Until Element Is Visible    ${BTN_BACK_TO_PRODUCTS}    

Verify Product Detail Page Elements
    Element Should Be Visible    ${BTN_BACK_TO_PRODUCTS}
    Element Should Be Visible    ${DETAIL_IMAGE}
    Element Should Be Visible    ${DETAIL_NAME}
    Element Should Be Visible    ${DETAIL_PRICE}
    Element Should Be Visible    ${BTN_ADD_TO_CART_DETAIL}

Click Back To Products
    Click Element    ${BTN_BACK_TO_PRODUCTS}
    Wait Until Element Is Visible    ${PRODUCT_LIST}    

Add To Cart From Detail Page
    Click Element    ${BTN_ADD_TO_CART_DETAIL}
    Wait Until Element Is Visible    ${CART_BADGE}    

Remove From Cart On Detail Page
    Click Element    ${BTN_ADD_TO_CART_DETAIL}
    Wait Until Element Is Not Visible    ${CART_BADGE}    

Add To Cart Backpack From Product List
    Click Element    ${BTN_ADD_TO_CART_BACKPACK}
    Wait Until Element Is Visible    ${CART_BADGE}    

Remove Backpack From Product List
    Click Element    ${BTN_REMOVE_BACKPACK}
    Wait Until Element Is Not Visible    ${CART_BADGE}   

Verify Cart Badge Count
    [Arguments]    ${expected_count}
    Element Text Should Be    ${CART_BADGE}    ${expected_count}

Verify Cart Badge Not Visible
    Element Should Not Be Visible    ${CART_BADGE}

Verify Button Changed To Remove
    Element Should Be Visible    ${BTN_REMOVE_BACKPACK}

Verify Button Changed To Add To Cart
    Element Should Be Visible    ${BTN_ADD_TO_CART_BACKPACK}
