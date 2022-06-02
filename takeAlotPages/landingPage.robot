*** Settings ***
Documentation                       This is the landing page object
Library                             SeleniumLibrary
Library                             String
Library                             Collections

*** Keywords ***
search for
    [Arguments]                     ${searchText}
    Input Text                      class:search-field      ${searchText}
    Click Button                    class:search-btn

click item
    [Arguments]                     ${itemIndex}
    Click Element                   css:[class='cell small-3']:nth-of-type(${itemIndex}) .shop-all-options