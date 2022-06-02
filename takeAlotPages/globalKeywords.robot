*** Settings ***
Documentation                       This is the global keywords page object
Library                             SeleniumLibrary
Library                             String
Library                             Collections

*** Keywords ***
go home
    Click Element                   css:a > img[alt='Takealot']

click an option in the department dropdown list
    [Arguments]                     ${departmentSelection}
    Select From List By Label       name:department             ${departmentSelection}