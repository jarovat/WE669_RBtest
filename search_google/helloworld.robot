*** Settings ***
Documentation    Example using the space separated format.
Library          OperatingSystem
Test Setup       Log To Console     Open App
Test Teardown    Log To Console     Close App

*** Variables ***
${MESSAGE}     Hello, world!

*** Keywords ***
My Keyword
    [Arguments]     ${path}
    Directory Should Exist    ${path}

*** Test Cases ***
TC01 My Test
    [Tags]    TC01
    [Documentation]     Example test.
    
    Log    ${MESSAGE}
    My Keyword     ${CURDIR}
TC02 Another Test
    [Tags]     TC02
    Should Be Equal   ${MESSAGE}     Hello, world!