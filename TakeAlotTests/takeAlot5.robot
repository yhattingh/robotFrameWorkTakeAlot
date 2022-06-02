*** Settings ***
Documentation                       This is our first Robot FrameWork Test
# Library section
Library                             SeleniumLibrary
Library                             String
Library                             Collections

# Global resources section
Resource                            ../frameworkClasses/globalSetup.robot

# Project resource section
Resource                            ../takeAlotPages/landingPage.robot
Resource                            ../takeAlotPages/itemsPage.robot
Resource                            ../takeAlotPages/dailyDealsPage.robot
Resource                            ../takeAlotPages/globalKeywords.robot

#Suite setup and tear down section
Suite Setup                          test setup     ${url}
#Suite Teardown                      Close Browser

# Test case templates
Test Template   Template Test Case

*** Variables ***
${url}  https://www.takealot.com/

*** Test Cases ***
Search for ladies shirts (Happy Case)
    #${searchItem}                                  ${gridItem}     ${itemSize}     ${itemColour}    ${stockMessage}
    Ladies Long Sleeve Nottingham Shirt             2               M               Grey             Ships in 4 - 6 work days
    Ladies Long Sleeve Nottingham Shirt             2               L               White            Ships in 4 - 6 work days
    Ladies Long Sleeve Nottingham Shirt             2               XL              White            Ships in 4 - 6 work days

*** Keywords ***
Template Test Case
    [Arguments]                     ${searchItem}   ${gridItem}   ${itemSize}   ${itemColour}   ${stockMessage}
    search for                      ${searchItem}
    click item                      ${gridItem}
    click size                      ${itemSize}
    check size                      ${itemSize}
    select from drop down list      ${itemColour}
    check title                     ${itemColour}    ${itemSize}
    check stock                     ${stockMessage}
