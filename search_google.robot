** Settings ***
Library         SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${URL}    https://google.com
${expected_result}    อยู่ที่ประมาณ 30,000-45,000

*** Keywords ***
เปิดเว็บ google.com ด้วย chrome
    Open Browser    ${URL}    chrome

ค้นหาคําว่า
    [Arguments]    ${keyword}
    Input Text    name=q    ${keyword}
    Capture Page Screenshot
    Submit Form
    Capture Page Screenshot

รอผลลัพธ์
    Wait Until Page Contains    ${expected_result}

*** Test Cases ***
SC01_TC01_Search case
    เปิดเว็บ google.com ด้วย chrome
    ค้นหาคําว่า    Tester จบใหม่ เงินเดือน
    รอผลลัพธ์
