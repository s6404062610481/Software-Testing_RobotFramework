*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

*** Variables ***
${LOGIN_PAGE}   http://localhost/shopping/Web/login.php
${BROWSER}      Chrome

*** Test Cases ***
Case1 Valid Credentials Login Test
    [Documentation]    Test logging in with valid credentials
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    bbb@email.com
    Input Password    name=password    bbb
    Click Button    name=submit
    Location Should Be  http://localhost/shopping/Web/index.php  
    Sleep    3s


Case2 Invalid Credentials Login Test
    [Documentation]    Test logging in with valid credentials
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    aaa@email.com
    Input Password    name=password    aaa
    Click Button    name=submit
    Wait Until Page Contains Element    css=.message
    ${message_text}=    Get Text    css=.message
    Should Be Equal As Strings    ${message_text}    Incorrect Password Or Email!
    Sleep    3s
    # Location Should Be  http://localhost/shopping/Web/index.php 


Case3 Empty Email and Password Login Test
    [Documentation]    Test logging in with an empty email field
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    ${EMPTY}
    Input Password    name=password    ${EMPTY}
    Click Button    name=submit
    Wait Until Page Contains Element    css=.message
    ${message_text}=    Get Text    css=.message
    Should Be Equal As Strings    ${message_text}    Please Enter Email And Password.
    Sleep    3s

Case4 Empty Email Login Test
    [Documentation]    Test logging in with an empty email field
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    ${EMPTY}
    Input Password    name=password    aaa
    Click Button    name=submit
    Wait Until Page Contains Element    css=.message
    ${message_text}=    Get Text    css=.message
    Should Be Equal As Strings    ${message_text}    Please Enter Email.
    Sleep    3s

Case5 Empty Password Login Test
    [Documentation]    Test logging in with an empty email field
    [Tags]    login
    Open Browser    http://localhost/shopping/Web/login.php  edge
    Input Text    name=email    aaa@email.com
    Input Password    name=password    ${EMPTY}
    Click Button    name=submit
    Wait Until Page Contains Element    css=.message
    ${message_text}=    Get Text    css=.message
    Should Be Equal As Strings    ${message_text}    Please Enter Password.
    Sleep    3s 


