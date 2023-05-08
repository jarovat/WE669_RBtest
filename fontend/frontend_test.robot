*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
เปิด browser ด้วย chrome
    Open Browser
...    http://hrc.idtesting.work/api/product.php
...    chrome 
    Maximize Browser Window


Login Default
    Input Text    user_form    student
    Input Text    password_form    we669
    Click Button    id=submitlogin
*** Test Cases ***

TC01 ทดสอบการเข้าสู่ระบบ แบบถูกต้อง
    เปิด browser ด้วย chrome
    Input Text    user_form    student
    Input Text    password_form    we669
    Click Button    id=submitlogin
    Wait Until Page Contains    รหัสสินค้า
    [Teardown]   Close Browser

TC02 ทดสอบการเข้าสู่ระบบ แบบไม่ถูกต้อง
    เปิด browser ด้วย chrome
    Input Text    user_form     prayoot
    Input Text    password_form     we623
    Submit Form
    Wait Until Page Contains     ระบุ Username และ Password ไม่ถูกต้อง
    [Teardown]     Close Browser

TC03 เพิ่มสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Input Text     product_name     กระเป๋าจ้า
    Input Text     product_price     4500
    Click Button     id=submitform
    Wait Until Page Contains     รายการสินค้า
    Capture Page Screenshot
    [Teardown]     Close Browser

TC04 แก้ไขสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click link     id=edit-1
    Capture Page Screenshot
    Input Text     product_name     กระเป๋าจ้า
    Input Text     product_price     17500
    Click Button     id=submitform
    Wait Until Page Contains     จัดการสินค้าของคุณ
    Capture Page Screenshot
    [Teardown]     Close Browser

TC05 ยืนยันและลบสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click Element     id=del-1
    Handle Alert     action=ACCEPT
    Wait Until Page Contains     จัดการสินค้าของคุณ
    [Teardown]     Close Browser

TC06 กดปุ่มลบ และยกเลิกการลบสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click Element     id=del-1
    Handle Alert     action=DISMISS
    Wait Until Page Contains     จัดการสินค้าของคุณ
    [Teardown]     Close Browser

TC06 ออกจากระบบ
    เปิด browser ด้วย chrome
    Login Default
    Click Element     id=logout
    Wait Until Page Contains     รายการสินค้า
    [Teardown]     Close Browser