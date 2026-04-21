*** Settings ***
Library        SeleniumLibrary
Resource       ../Master_resources.robot
Suite Setup        Set Selenium Speed    0.5s 
Test Setup         Setup Browser    ${URL}    ${BROWSER}
Test Teardown      Close Browser
Suite Teardown     Close All Browsers
#Total Test Cases: TC012 - TC029

*** Test Cases ***

TC012 - Products Page - ตรวจสอบหน้า Products Default
    [Documentation]    ตรวจสอบหน้า Products มีรายละเอียดครบถ้วน หลัง Login สำเร็จ
    [Tags]    TC012    Products    DefaultPage    Positive
    Login As Standard User
    Verify Products Page Elements

TC013 - Menu - เปิด Menu
    [Documentation]    ตรวจสอบการกดปุ่ม Menu แสดงแถบเมนูครบถ้วน
    [Tags]    TC013    Menu    Positive
    Login As Standard User
    Open Menu
    Verify Menu Elements

TC014 - Menu - ปิด Menu
    [Documentation]    ตรวจสอบการกดปุ่มปิด Menu ทำให้แถบ Menu หายไป
    [Tags]    TC014    Menu    Positive
    Login As Standard User
    Open Menu
    Close Menu
    Element Should Not Be Visible    ${MENU_SIDEBAR}

TC015 - Menu - กดปุ่ม All Items
    [Documentation]    ตรวจสอบการกดปุ่ม All Items แสดงรายการสินค้าทั้งหมด
    [Tags]    TC015    Menu    Positive
    Login As Standard User
    Open Menu
    Click Menu All Items
    Element Should Be Visible    ${PRODUCT_LIST}

TC016 - Menu - กดปุ่ม About
    [Documentation]    ตรวจสอบการกดปุ่ม About นำไปสู่เว็บ saucelabs.com
    [Tags]    TC016    Menu    Positive
    Login As Standard User
    Open Menu
    Click Menu About
    Location Should Contain    saucelabs.com

TC017 - Menu - กดปุ่ม Logout
    [Documentation]    ตรวจสอบการกดปุ่ม Logout กลับสู่หน้า Login
    [Tags]    TC017    Menu    Positive
    Login As Standard User
    Open Menu
    Click Menu Logout
    Verify Login Page Elements

TC018 - Menu - กดปุ่ม Reset
    [Documentation]    ตรวจสอบการกดปุ่ม Reset กลับหน้าจอ Products
    [Tags]    TC018    Menu    Positive
    Login As Standard User
    Open Menu
    Click Menu Reset
    Wait Until Element Is Visible    css=.title    timeout=10s
    Element Text Should Be    css=.title    Products

TC019 - Sort By - เปิด Dropdown Sort By
    [Documentation]    ตรวจสอบ Dropdown Sort By มีตัวเลือกครบถ้วน
    [Tags]    TC019    SortBy    Positive
    Login As Standard User
    Verify Sort Dropdown Options

TC020 - Sort By - Name (A to Z)
    [Documentation]    ตรวจสอบการเรียงสินค้าตามชื่อ A ไป Z
    [Tags]    TC020    SortBy    Positive
    Login As Standard User
    Select Sort Option    ${SORT_AZ}
    Verify Products Sorted By Name A To Z

TC021 - Sort By - Name (Z to A)
    [Documentation]    ตรวจสอบการเรียงสินค้าตามชื่อ Z ไป A
    [Tags]    TC021    SortBy    Positive
    Login As Standard User
    Select Sort Option    ${SORT_ZA}
    Verify Products Sorted By Name Z To A

TC022 - Sort By - Price (Low to High)
    [Documentation]    ตรวจสอบการเรียงสินค้าตามราคา ต่ำไปสูง
    [Tags]    TC022    SortBy    Positive
    Login As Standard User
    Select Sort Option    ${SORT_LOW_HIGH}
    ${prices}=    Get WebElements    ${PRODUCT_PRICE}
    ${price_list}=    Create List
    FOR    ${price}    IN    @{prices}
        ${text}=    Get Text    ${price}
        ${num}=    Evaluate    float('${text}'.replace('$',''))
        Append To List    ${price_list}    ${num}
    END
    ${sorted}=    Copy List    ${price_list}
    Sort List    ${sorted}
    Lists Should Be Equal    ${price_list}    ${sorted}

TC023 - Sort By - Price (High to Low)
    [Documentation]    ตรวจสอบการเรียงสินค้าตามราคา สูงไปต่ำ
    [Tags]    TC023    SortBy    Positive
    Login As Standard User
    Select Sort Option    ${SORT_HIGH_LOW}
    ${prices}=    Get WebElements    ${PRODUCT_PRICE}
    ${price_list}=    Create List
    FOR    ${price}    IN    @{prices}
        ${text}=    Get Text    ${price}
        ${num}=    Evaluate    float('${text}'.replace('$',''))
        Append To List    ${price_list}    ${num}
    END
    ${sorted}=    Copy List    ${price_list}
    Sort List    ${sorted}
    Reverse List    ${sorted}
    Lists Should Be Equal    ${price_list}    ${sorted}

TC024 - Product Detail - ตรวจสอบหน้ารายละเอียดสินค้า
    [Documentation]    ตรวจสอบหน้ารายละเอียดสินค้าเมื่อกด Link รูปภาพ/ชื่อสินค้า
    [Tags]    TC024    ProductDetail    Positive
    Login As Standard User
    Click Product Image Backpack
    Verify Product Detail Page Elements

TC025 - Product Detail - กดปุ่ม Back to Products
    [Documentation]    ตรวจสอบการกดปุ่ม Back to Products กลับสู่หน้า Products
    [Tags]    TC025    ProductDetail    Positive
    Login As Standard User
    Click Product Image Backpack
    Click Back To Products
    Element Should Be Visible    ${PRODUCT_LIST}

TC026 - Product Detail - กดปุ่ม Add to Cart ในหน้ารายละเอียดสินค้า
    [Documentation]    ตรวจสอบการกดปุ่ม Add to Cart ในหน้ารายละเอียดสินค้า
    [Tags]    TC026    ProductDetail    Cart    Positive
    Login As Standard User
    Click Product Image Backpack
    Add To Cart From Detail Page
    Verify Cart Badge Count    1
    Element Should Be Visible    css=.btn_secondary

TC027 - Product Detail - กดปุ่ม Remove ในหน้ารายละเอียดสินค้า
    [Documentation]    ตรวจสอบการกดปุ่ม Remove ในหน้ารายละเอียดสินค้า
    [Tags]    TC027    ProductDetail    Cart    Positive
    Login As Standard User
    Click Product Image Backpack
    Add To Cart From Detail Page
    Remove From Cart On Detail Page
    Verify Cart Badge Not Visible
    Element Should Be Visible    css=.btn_primary

TC028 - Product List - กดปุ่ม Add to Cart ในหน้า Products
    [Documentation]    ตรวจสอบการกดปุ่ม Add to Cart แสดง Badge จำนวนสินค้าในตะกร้า
    [Tags]    TC028    ProductList    Cart    Positive
    Login As Standard User
    Add To Cart Backpack From Product List
    Verify Cart Badge Count    1
    Verify Button Changed To Remove

TC029 - Product List - กดปุ่ม Remove ในหน้า Products
    [Documentation]    ตรวจสอบการกดปุ่ม Remove Badge หายและปุ่มกลับเป็น Add to Cart
    [Tags]    TC029    ProductList    Cart    Positive
    Login As Standard User
    Add To Cart Backpack From Product List
    Remove Backpack From Product List
    Verify Cart Badge Not Visible
    Verify Button Changed To Add To Cart
