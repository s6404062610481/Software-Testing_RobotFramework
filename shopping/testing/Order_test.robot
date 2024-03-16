*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

*** Variables ***
${LOGIN_URL}           http://localhost/shopping/Web/login.php
${INDEX_URL}           http://localhost/shopping/Web/index.php
${BROWSER}             edge
${EMAIL}               bbb@email.com
${PASSWORD}            bbb

${PRODUCT_NAME}        product_1
${PRODUCT_NAME_IN_CART}    //td[contains(text(),'${PRODUCT_NAME}')]

${expected_grand_total}    3222
*** Test Cases ***
Case1 Add Products To Cart Test
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    name=email    ${EMAIL}
    Input Password    name=password    ${PASSWORD}
    Click Button    name=submit
    Location Should Be    ${INDEX_URL}
    Click Button    name=add_to_cart
    ${message}    Get Text    xpath=//div[@class="message"]
    Should Be Equal As Strings    ${message}    Product Already Added To Cart!
    Sleep    3s
Case2 Check Product In Shopping Cart Test
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    name=email    ${EMAIL}
    Input Password    name=password    ${PASSWORD}
    Click Button    name=submit
    Location Should Be    ${INDEX_URL}
    Click Button    name=add_to_cart
    Wait Until Element Is Visible    ${PRODUCT_NAME_IN_CART}
    ${actual_result}=    Get Text    ${PRODUCT_NAME_IN_CART}
    [Teardown]    Sleep    3s
Case3 Check GrandTotal In Shopping Cart Test
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    name=email    ${EMAIL}
    Input Password    name=password    ${PASSWORD}
    Click Button    name=submit
    Location Should Be    ${INDEX_URL}
    Click Button    name=add_to_cart

    ${grand_total}    Get Text    xpath=//tr[@class='table-bottom']/td[contains(text(), 'grand total')]/following-sibling::td
    Log    Grand Total: ${grand_total}
    Should Be Equal As Numbers    ${grand_total.replace("$", "").replace("/-", "").strip()}    ${expected_grand_total}
    Sleep    3s