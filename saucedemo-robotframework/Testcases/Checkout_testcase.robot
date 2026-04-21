*** Settings ***
Library        SeleniumLibrary
Resource       ../Master_resources.robot
Suite Setup        Set Selenium Speed    0.5s 
Test Setup         Setup Browser    ${URL}    ${BROWSER}
Test Teardown      Close Browser
Suite Teardown     Close All Browsers
#Total Test Cases: TC030 - TC050

*** Test Cases ***

TC030 - Cart Page - ตรวจสอบ Default Your Cart Page
    [Documentation]    ตรวจสอบหน้า Your Cart มีรายละเอียดครบถ้วนเมื่อกดปุ่ม Shopping Cart
    [Tags]    TC030    Cart    DefaultPage    Positive
    Login As Standard User
    Add To Cart Backpack From Product List
    Go To Shopping Cart
    Verify Your Cart Page Elements

TC031 - Cart Page - กด Link ชื่อสินค้าในหน้า Your Cart
    [Documentation]    ตรวจสอบการกด Link ชื่อสินค้าในหน้า Your Cart กลับไปหน้ารายละเอียดสินค้า
    [Tags]    TC031    Cart    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Cart Item Name Link
    Element Should Be Visible    ${BTN_BACK_TO_PRODUCTS}

TC032 - Cart Page - กดปุ่ม Remove ในหน้า Your Cart
    [Documentation]    ตรวจสอบการกดปุ่ม Remove ในหน้า Your Cart ลบสินค้าออกจากตะกร้า
    [Tags]    TC032    Cart    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Remove Item From Cart Page
    Verify Item Not Visible In Cart

TC033 - Cart Page - กดปุ่ม Continue Shopping
    [Documentation]    ตรวจสอบการกดปุ่ม Continue Shopping กลับสู่หน้า Products
    [Tags]    TC033    Cart    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Continue Shopping
    Element Text Should Be    css=.title    Products

TC034 - Cart Page - กดปุ่ม Checkout
    [Documentation]    ตรวจสอบการกดปุ่ม Checkout เข้าสู่หน้า Checkout: Your Information
    [Tags]    TC034    Cart    Checkout    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Verify Checkout Info Page Elements

TC035 - Checkout Info - กรอก First Name ที่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอก Field First Name ในรูปแบบที่ถูกต้อง
    [Tags]    TC035    CheckoutInfo    FirstName    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_FIRST_NAME}    ${FIRST_NAME}
    Element Attribute Value Should Be    ${INPUT_FIRST_NAME}    value    ${FIRST_NAME}

TC036 - Checkout Info - กรอก First Name ที่ไม่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอก Field First Name ในรูปแบบที่ไม่ถูกต้อง (@ชื่อ)
    [Tags]    TC036    CheckoutInfo    FirstName    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_FIRST_NAME}    ${INVALID_FIRST_NAME}
    Element Attribute Value Should Be    ${INPUT_FIRST_NAME}    value    ${INVALID_FIRST_NAME}

TC037 - Checkout Info - กรอก Last Name ที่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอก Field Last Name ในรูปแบบที่ถูกต้อง
    [Tags]    TC037    CheckoutInfo    LastName    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_LAST_NAME}    ${LAST_NAME}
    Element Attribute Value Should Be    ${INPUT_LAST_NAME}    value    ${LAST_NAME}

TC038 - Checkout Info - กรอก Last Name ที่ไม่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอก Field Last Name ในรูปแบบที่ไม่ถูกต้อง (@นามสกุล)
    [Tags]    TC038    CheckoutInfo    LastName    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_LAST_NAME}    ${INVALID_LAST_NAME}
    Element Attribute Value Should Be    ${INPUT_LAST_NAME}    value    ${INVALID_LAST_NAME}


TC039 - Checkout Info - กรอก Zip/Postal Code ที่ถูกต้อง (ตัวเลข)
    [Documentation]    ตรวจสอบการกรอก Field Zip/Postal Code ในรูปแบบที่ถูกต้อง (ตัวเลข)
    [Tags]    TC039    CheckoutInfo    PostalCode    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_POSTAL_CODE}    ${POSTAL_CODE}
    Element Attribute Value Should Be    ${INPUT_POSTAL_CODE}    value    ${POSTAL_CODE}

TC040 - Checkout Info - กรอก Zip/Postal Code ที่ไม่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอก Field Zip/Postal Code ในรูปแบบที่ไม่ถูกต้อง (ab@1235)
    [Tags]    TC040    CheckoutInfo    PostalCode    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_POSTAL_CODE}    ${INVALID_POSTAL_CODE}
    Element Attribute Value Should Be    ${INPUT_POSTAL_CODE}    value    ${INVALID_POSTAL_CODE}
    

TC041 - Checkout Info - กดปุ่ม Cancel กลับสู่หน้า Your Cart
    [Documentation]    ตรวจสอบการกดปุ่ม Cancel ในหน้า Checkout: Your Information กลับสู่หน้า Your Cart
    [Tags]    TC041    CheckoutInfo    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Click Cancel On Info Page
    Element Text Should Be    ${CART_TITLE}    ${TITLE_YOUR_CART}

TC042 - Checkout Info - ไม่กรอก First Name แล้วกด Continue
    [Documentation]    ตรวจสอบการกด Continue เมื่อไม่กรอก First Name แสดง error
    [Tags]    TC042    CheckoutInfo    RequiredField    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_LAST_NAME}     ${LAST_NAME}
    Input Text    ${INPUT_POSTAL_CODE}   ${POSTAL_CODE}
    Click Continue Button
    Verify Checkout Error Message    ${ERR_FIRST_NAME_REQUIRED}

TC043 - Checkout Info - ไม่กรอก Last Name แล้วกด Continue
    [Documentation]    ตรวจสอบการกด Continue เมื่อไม่กรอก Last Name แสดง error
    [Tags]    TC043    CheckoutInfo    RequiredField    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_FIRST_NAME}    ${FIRST_NAME}
    Input Text    ${INPUT_POSTAL_CODE}   ${POSTAL_CODE}
    Click Continue Button
    Verify Checkout Error Message    ${ERR_LAST_NAME_REQUIRED}

TC044 - Checkout Info - ไม่กรอก Postal Code แล้วกด Continue
    [Documentation]    ตรวจสอบการกด Continue เมื่อไม่กรอก Postal Code แสดง error
    [Tags]    TC044    CheckoutInfo    RequiredField    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Text    ${INPUT_FIRST_NAME}    ${FIRST_NAME}
    Input Text    ${INPUT_LAST_NAME}     ${LAST_NAME}
    Click Continue Button
    Verify Checkout Error Message    ${ERR_POSTAL_CODE_REQUIRED}

TC045 - Checkout Info - ไม่กรอกข้อมูลใดเลยแล้วกด Continue
    [Documentation]    ตรวจสอบการกด Continue เมื่อไม่กรอกข้อมูลใดเลย แสดง First Name required
    [Tags]    TC045    CheckoutInfo    RequiredField    Negative
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Click Continue Button
    Verify Checkout Error Message    ${ERR_FIRST_NAME_REQUIRED}

TC046 - Checkout Info - กรอกข้อมูลถูกต้องและกด Continue เข้าสู่หน้า Overview
    [Documentation]    ตรวจสอบการกรอกข้อมูลครบและกด Continue เข้าสู่หน้า Checkout: Overview
    [Tags]    TC046    CheckoutInfo    CheckoutOverview    Positive
    Login As Standard User
    Add Backpack To Cart And Go To Cart
    Click Checkout Button
    Input Checkout Information    ${FIRST_NAME}    ${LAST_NAME}    ${POSTAL_CODE}
    Click Continue Button
    Verify Checkout Overview Page Elements

TC047 - Checkout Overview - กด Link ชื่อสินค้าในหน้า Overview
    [Documentation]    ตรวจสอบการกด Link ชื่อสินค้าในหน้า Checkout: Overview กลับหน้ารายละเอียดสินค้า
    [Tags]    TC047    CheckoutOverview    Positive
    Login As Standard User
    Complete Checkout Flow
    Click Overview Item Name Link
    Element Should Be Visible    ${BTN_BACK_TO_PRODUCTS}

TC048 - Checkout Overview - กดปุ่ม Cancel กลับสู่หน้า Products
    [Documentation]    ตรวจสอบการกดปุ่ม Cancel ในหน้า Checkout: Overview กลับสู่หน้า Products
    [Tags]    TC048    CheckoutOverview    Positive
    Login As Standard User
    Complete Checkout Flow
    Click Cancel On Overview Page
    Element Text Should Be    css=.title    Products

TC049 - Checkout Overview - กดปุ่ม Finish เข้าสู่หน้า Checkout Complete
    [Documentation]    ตรวจสอบการกดปุ่ม Finish เข้าสู่หน้า Checkout: Complete! สั่งซื้อสำเร็จ
    [Tags]    TC049    CheckoutOverview    CheckoutComplete    Positive
    Login As Standard User
    Complete Checkout Flow
    Click Finish Button
    Verify Checkout Complete Page

TC050 - Checkout Complete - กดปุ่ม Back Home กลับสู่หน้า Products
    [Documentation]    ตรวจสอบการกดปุ่ม Back Home ในหน้า Checkout: Complete! กลับสู่หน้า Products
    [Tags]    TC050    CheckoutComplete    Positive
    Login As Standard User
    Complete Checkout Flow
    Click Finish Button
    Click Back Home Button
    Element Text Should Be    css=.title    Products

#robot Testcases/Login_testcase.robot
#robot Testcases/Inventory_testcase.robot
#robot Testcases/Checkout_testcase.robot