*** Settings ***
Documentation   This is our first Robot FrameWork Test
Library         SeleniumLibrary
Library         ../customLibraries/chromedriversync.py
Library    XML
Library    String
Library    Collections
Suite Setup     test setup
#Suite Teardown  Close Browser

*** Variables ***
${url}  https://www.takealot.com/


*** Test Cases ***
First test case
    search for    Ladies long sleeve nottingham shirt
    click item    2
    click size    M
    check size    M
    select from drop down list  Grey
    check title    Grey    M
    check stock    Ships in 4 - 6 work days


*** Keywords ***
search for
    [Arguments]         ${searchText}
    Input Text          class:search-field      ${searchText}
    Click Button        class:search-btn

click item
    [Arguments]         ${itemIndex}
    Click Element       css:[class='cell small-3']:nth-of-type(${itemIndex}) .shop-all-options
    
click size
    [Arguments]         ${itemsize}
    Click Button        ${itemsize}

select from drop down list
    [Arguments]         ${dropDownOption}
    Click Element       xpath://div[@role='listbox']
    Click Element       link:${dropDownOption}

check size
    [Arguments]         ${articleSize}
    Element Text Should Be    css:.variant-selector-module_selector-selected_18T_4    ${articleSize}

check title
    [Arguments]         ${itemColour}           ${itemSize}
    Wait Until Element Contains     css:.pdp-main-panel h1      ${itemColour}
    ${getTitle}=        Get Text    css:.pdp-main-panel h1
    Log To Console      ${getTitle}
    ${result}=          Split String    ${getTitle}     -
    Log To Console      ${result}
    ${actualTitleColour}=   Get From List    ${result}    1
    ${actualTitleSize}=     Get From List    ${result}    2

    # Assertions
    Should Be Equal       ${actualTitleColour.strip()}      ${itemColour}
    Should Be Equal       ${actualTitleSize.strip()}        ${itemSize}

check stock
    [Arguments]                ${StockMessage}
    Element Text Should Be    css:.cell.shrink.stock-availability-status    ${StockMessage}




test setup
    ${chromedriver_path}=   Get Chromedriver Path
    Create Webdriver                Chrome      executable_path=${chromedriver_path}
    Go To                           ${url}
    Maximize Browser Window
    Set Browser Implicit Wait       10
    Wait Until Keyword Succeeds     3    10    Click Button    class:cookies-banner-module_dismiss-button_24Z98
    Capture Page Screenshot         EMBED

