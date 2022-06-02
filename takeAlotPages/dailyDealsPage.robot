*** Settings ***
Documentation                       This is the daily deals page object
Library                             SeleniumLibrary
Library                             String
Library                             Collections

*** Keywords ***
click daily deals button
    Click Element                   css:.flyout-button
    
click radio button
    Click Element                   css:.filter_Availability_Availability.radio-select-group > div:nth-of-type(1)
    
click check box
    Click Element                   css:div > li:nth-of-type(1)