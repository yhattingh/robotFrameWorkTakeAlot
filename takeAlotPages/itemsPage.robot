*** Settings ***
Documentation                       This is the items page object
Library                             SeleniumLibrary
Library                             String
Library                             Collections

*** Keywords ***
click size
    [Arguments]                     ${itemsize}
    Click Button                    ${itemsize}

select from drop down list
    [Arguments]                     ${dropDownOption}
    Click Element                   xpath://div[@role='listbox']
    Click Element                   link:${dropDownOption}

check size
    [Arguments]                     ${articleSize}
    Element Text Should Be          css:.variant-selector-module_selector-selected_18T_4    ${articleSize}

check title
    [Arguments]                     ${itemColour}           ${itemSize}
    Wait Until Element Contains     css:.pdp-main-panel h1      ${itemColour}
    ${getTitle}=    Get Text        css:.pdp-main-panel h1
    Log To Console                  ${getTitle}
    ${result}=      Split String    ${getTitle}     -
    Log To Console                  ${result}
    ${actualTitleColour}=   Get From List    ${result}    1
    ${actualTitleSize}=     Get From List    ${result}    2

    # Assertions
    Should Be Equal                 ${actualTitleColour.strip()}      ${itemColour}
    Should Be Equal                 ${actualTitleSize.strip()}        ${itemSize}

check stock
    [Arguments]                     ${StockMessage}
    Element Text Should Be          css:.cell.shrink.stock-availability-status    ${StockMessage}
