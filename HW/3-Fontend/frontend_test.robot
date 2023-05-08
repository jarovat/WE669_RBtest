*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
เปิด browser ด้วย chrome
    Open Browser
...    http://hrc.idtesting.work/api/product.php
...    chrome 
    Maximize Browser Window


Login Default
    Input Text    user_form    645159090011
    Click Button    id=submitlogin
*** Test Cases ***

TC01 ทดสอบการเข้าสู่ระบบ 
    เปิด browser ด้วย chrome
    Input Text    user_form    645159090011
    Click Button    id=submitlogin
    Wait Until Page Contains    รหัสสินค้า
    [Teardown]   Close Browser

TC02 เพิ่มสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Input Text     product_name     กระเป๋า
    Input Text     product_price     2000
    Click Button     id=submitform
    Wait Until Page Contains     รายการสินค้า
    Capture Page Screenshot
    [Teardown]     Close Browser

TC03 แก้ไขสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click link     id=edit-1
    Capture Page Screenshot
    Input Text     product_name     กระเป๋าหนัง
    Input Text     product_price     1000
    Click Button     id=submitform
    Wait Until Page Contains     จัดการสินค้าของคุณ
    Capture Page Screenshot
    [Teardown]     Close Browser

TC04 ยืนยันและลบสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click Element     id=del-1
    Handle Alert     action=ACCEPT
    Wait Until Page Contains     จัดการสินค้าของคุณ
    [Teardown]     Close Browser

TC05 กดปุ่มลบ และยกเลิกการลบสินค้า
    เปิด browser ด้วย chrome
    Login Default
    Click Element     id=del-1
    Handle Alert     action=DISMISS
    Wait Until Page Contains     จัดการสินค้าของคุณ
    [Teardown]     Close Browser
