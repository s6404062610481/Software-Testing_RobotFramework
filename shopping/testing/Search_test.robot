*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

*** Variables ***
${LOGIN_PAGE}   http://localhost/shopping/Web/login.php

*** Test Cases ***
Case1 Search Valid Test
    [Documentation]    Test logging in with valid credentials
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    bbb@email.com
    Input Password    name=password    bbb
    Click Button    name=submit
    Location Should Be  http://localhost/shopping/Web/index.php 
    Input Text    name=search    product_1
    Click Button    name=search-btn
    Location Should Be  http://localhost/shopping/Web/index.php?search=product_1&search-btn=  
    Sleep    3s

Case2 Search Invalid Test
    [Documentation]    Test logging in with valid credentials
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    bbb@email.com
    Input Password    name=password    bbb
    Click Button    name=submit
    Location Should Be  http://localhost/shopping/Web/index.php 
    Input Text    name=search    asdfasdfasf
    Click Button    name=search-btn
    ${message}    Get Text    xpath=//div[@class="message"]
    Should Be Equal As Strings    ${message}    No Products Found Matching Your Search.
    Sleep    3s

Case3 Search EMPTY Test
    [Documentation]    Test logging in with valid credentials
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    bbb@email.com
    Input Password    name=password    bbb
    Click Button    name=submit
    Location Should Be  http://localhost/shopping/Web/index.php 
    Input Text    name=search    ${EMPTY}
    Click Button    name=search-btn
    Location Should Be  http://localhost/shopping/Web/index.php?search=&search-btn=
    Sleep    3s
