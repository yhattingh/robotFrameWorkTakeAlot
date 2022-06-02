*** Settings ***
Documentation   This is our first Robot FrameWork Test
Library         SeleniumLibrary
Library         ../customLibraries/chromedriversync.py
Suite Setup     test setup
#Suite Teardown  Close Browser

*** Variables ***
${url}  https://www.takealot.com/

*** Test Cases ***
##First test case
    #search for    Artigiano - Oh Deer Design Black T-Shirt
    # This will click the second item in the grid
    #click item    2
    #click size    M

###Second test case
    #search for    Artigiano - Oh Deer Design Black T-Shirt
    # This will click the second item in the grid
    #click item    3
    #click size    L

###Third test case
    #search for    Artigiano - Oh Deer Design Black T-Shirt
    # This will click the second item in the grid
    #click item    4
    #click size    2XL

Fourth test case
    search for    Artigiano - Ali Design Black T-Shirt
    # This will click the second item in the grid
    click item    4
    click size    3XL
    click addToCartButton

*** Keywords ***
search for
    [Arguments]     ${searchText}
    Input Text      class:search-field      ${searchText}
    Click Button    class:search-btn

click item
    [Arguments]     ${itemIndex}
    Click Element    css:[class='cell small-3']:nth-of-type(${itemIndex}) .shop-all-options
    
click size
    [Arguments]     ${itemsize}
    Click Button    ${itemsize}
    #Wait Until Keyword Succeeds    3    10    Click Button  css:div:nth-of-type(${itemsize}) > .button.has-tooltip.image-fallback.size.variant-selector-module_button-selector_1-w9B.variant-selector-module_image-button_1gV7u

click addToCartButton
    Click Button    class:add-to-cart-button


test setup
    ${chromedriver_path}=   Get Chromedriver Path
    Create Webdriver                Chrome      executable_path=${chromedriver_path}
    Go To                           ${url}
    Maximize Browser Window
    Set Browser Implicit Wait       10
    Wait Until Keyword Succeeds     3    10    Click Button    class:cookies-banner-module_dismiss-button_24Z98
    Capture Page Screenshot         EMBED

