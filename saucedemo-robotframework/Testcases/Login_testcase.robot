*** Settings ***
Library        SeleniumLibrary
Resource       ../Master_resources.robot
Suite Setup        Set Selenium Speed    0.5s 
Test Setup         Setup Browser    ${URL}    ${BROWSER}
Test Teardown      Close Browser
Suite Teardown     Close All Browsers
#Total Test Cases: TC001 - TC011

*** Test Cases ***

TC001 - Default Page - ตรวจสอบหน้าจอ Default
    [Documentation]    ตรวจสอบว่าเมื่อเข้าเว็บ saucedemo.com แสดงหน้า Login พร้อมรายละเอียดครบถ้วน
    [Tags]    TC001    Login    DefaultPage    Positive
    Verify Login Page Elements

TC002 - Login - กรอก Username ที่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอกข้อมูล Field Username ในรูปแบบที่ถูกต้อง
    [Tags]    TC002    Login    Username    Positive
    Input Username    ${VALID_USERNAME}
    Element Attribute Value Should Be    ${INPUT_USERNAME}    value    ${VALID_USERNAME}

TC003 - Login - กรอก Username ที่ไม่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอกข้อมูล Field Username ในรูปแบบที่ไม่ถูกต้อง (ภาษาไทย)
    [Tags]    TC003    Login    Username    Negative
    Input Username    ${INVALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Error Message    ${ERR_INVALID_CRED}

TC004 - Login - กรอก Password ที่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอกข้อมูล Field Password ในรูปแบบที่ถูกต้อง
    [Tags]    TC004    Login    Password    Positive
    Input Password    ${VALID_PASSWORD}
    Element Attribute Value Should Be    ${INPUT_PASSWORD}    value    ${VALID_PASSWORD}

TC005 - Login - กรอก Password ที่ไม่ถูกต้อง
    [Documentation]    ตรวจสอบการกรอกข้อมูล Field Password ในรูปแบบที่ไม่ถูกต้อง (ภาษาไทย)
    [Tags]    TC005    Login    Password    Negative
    Input Username    ${VALID_USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Click Login Button
    Verify Error Message    ${ERR_INVALID_CRED}

TC006 - Login - Login สำเร็จด้วย Username และ Password ที่ถูกต้อง
    [Documentation]    ตรวจสอบการ Login โดยกรอก Username และ Password ที่ลงทะเบียนไว้
    [Tags]    TC006    Login    Positive
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Login Success

TC007 - Login - Login ด้วย Username และ Password ที่ไม่ได้ลงทะเบียน
    [Documentation]    ตรวจสอบการ Login โดยกรอก Username และ Password ที่ไม่ได้ลงทะเบียน
    [Tags]    TC007    Login    Negative
    Login With Credentials    ${WRONG_USERNAME}    ${WRONG_PASSWORD}
    Verify Error Message    ${ERR_INVALID_CRED}

TC008 - Login - ไม่กรอก Username
    [Documentation]    ตรวจสอบการ Login เมื่อไม่กรอก Field Username
    [Tags]    TC008    Login    Negative    RequiredField
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Verify Error Message    ${ERR_USERNAME_REQUIRED}

TC009 - Login - ไม่กรอก Password
    [Documentation]    ตรวจสอบการ Login เมื่อไม่กรอก Field Password
    [Tags]    TC009    Login    Negative    RequiredField
    Input Username    ${VALID_USERNAME}
    Click Login Button
    Verify Error Message    ${ERR_PASSWORD_REQUIRED}

TC010 - Login - ไม่กรอกทั้ง Username และ Password
    [Documentation]    ตรวจสอบการ Login เมื่อไม่กรอกข้อมูลใดเลย
    [Tags]    TC010    Login    Negative    RequiredField
    Click Login Button
    Verify Error Message    ${ERR_USERNAME_REQUIRED}

TC011 - Login - Login ด้วย Username ที่ถูก Lock
    [Documentation]    ตรวจสอบการ Login ด้วย locked_out_user
    [Tags]    TC011    Login    Negative    LockedUser
    Login With Credentials    ${LOCKED_USERNAME}    ${VALID_PASSWORD}
    Verify Error Message    ${ERR_LOCKED_OUT}
