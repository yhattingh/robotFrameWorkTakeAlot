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
Suite Setup                         test setup
#Suite Teardown                      Close Browser

*** Variables ***
${url}                              https://www.takealot.com/

*** Test Cases ***
Search for ladies shirts
    search for                      Ladies long sleeve nottingham shirt
    click item                      2
    click size                      M
    check size                      M
    select from drop down list      Grey
    check title                     Grey    M
    check stock                     Ships in 4 - 6 work days

Click daily deals button and filter items
    go home
    click daily deals button
    click radio button
    click check box

Select an item from the department list
    go home
    click an option in the department dropdown list     Books

