*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
SearchTest1

    Open Browser  http://openncart.herokuapp.com/  chrome

    Input Text  //*[@id="search"]/input  Canon

    Press Keys  //*[@id="search"]/span/button  [Return]

    Page Should Contain  Canon EOS 5D

    Close Browser


SearchTest2

    Open Browser  http://openncart.herokuapp.com/  chrome

    Input Text  //*[@id="search"]/input  Lenovo

    Press Keys  //*[@id="search"]/span/button  [Return]

    Page Should Contain  There is no product that matches the search criteria.

    Close Browser

*** Keywords ***