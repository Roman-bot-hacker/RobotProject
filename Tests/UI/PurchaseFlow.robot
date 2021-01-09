*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Test Cases ***
Guest Purchase Flow
    [Documentation]  This is the customer flow, where customer purchase the good as a guest user;
    [Tags]  Functonal

    #Open the site
    Test Pre-Condition

    #search for necessary good
    Test Search

    #add good to customer's basket
    Add Good to Basket

    #wait for site's update
    Sleep  2s

    #user go to checkout page to confirm purchase
    Call Checkout

    #user selects purchase "As a guest" option
    Perform Guest Purchase

    #user enters his\her personal data
    Enter Customer Data

    #user gets alert message when fields are verified
    Check Requred Data Verification

    #user leaves comment for purchase
    Leave Comment

    #wait for site's update
    Sleep  1s

    #user confirms terms&conditions statements
    Confirm Terms&Conditions

    #wait for site's update
    Sleep  1s

    #user performs final confirmation
    Confirm Purchase

    #user finishes flow and returns to Home Page
    Return to Home Page

    #wait before finishing Test Case
    Sleep  3s

    #Close Browser
    Test Post-Condition



*** Keywords ***

Test Pre-Condition
    Open Browser  http://openncart.herokuapp.com/  chrome
    Maximize Browser Window

Test Search
    Input Text  //*[@id="search"]/input  iPhone
    Press Keys  //*[@id="search"]/span/button  [Return]
    Page Should Contain  iPhone is a revolutionary new mobile

Add Good to Basket
    Click Button  //*[@id="content"]/div[3]/div/div/div[3]/button[1]
    Wait until page contains  Success:

Call Checkout
    wait until element is enabled  //*[@id="cart"]/button
    Click Button  //*[@id="cart"]/button
    wait until element is enabled  //*[@id="cart"]/ul/li[2]/div/p/a[2]
    Click Link  //*[@id="cart"]/ul/li[2]/div/p/a[2]
    Wait until Page contains  New Customer

Perform Guest Purchase
    Wait until element is enabled  //*[@id="collapse-checkout-option"]/div/div/div[1]/div[2]/label/input
    Click element  //*[@id="collapse-checkout-option"]/div/div/div[1]/div[2]/label/input
    Click Button  //*[@id="button-account"]
    Wait until page contains  Your Personal Details

Enter Customer Data
    Input Text  //*[@id="input-payment-firstname"]  Rem
    Input Text  //*[@id="input-payment-lastname"]  Raven
    Input Text  //*[@id="input-payment-email"]  noreply@gmail.com
    Input Text  //*[@id="input-payment-address-1"]  Private str. 1
    Input Text  //*[@id="input-payment-city"]  Lviv
    Input Text  //*[@id="input-payment-postcode"]  01234
    Select From List By Value  //*[@id="input-payment-country"]  220
    Wait until page does not contain  //*[@id="address"]/div[6]/i
    Wait until element is enabled  //*[@id="input-payment-zone"]
    Sleep  1s
    Select From List By Value  //*[@id="input-payment-zone"]  3493
    Click Button  //*[@id="button-guest"]

Check Requred Data Verification
    Wait until page contains element  //*[@id="account"]/div[5]/div
    Input Text  //*[@id="input-payment-telephone"]  +380631234567
    Click Button  //*[@id="button-guest"]
    Wait until page contains  Please select the preferred shipping method to use on this order.

Leave Comment
    Wait until element is enabled  //*[@id="collapse-shipping-method"]/div/p[4]/textarea
    Input Text  //*[@id="collapse-shipping-method"]/div/p[4]/textarea  I love my purchase.
    Click Button  //*[@id="button-shipping-method"]

Confirm Terms&Conditions
    Select Checkbox  //*[@id="collapse-payment-method"]/div/div[2]/div/input[1]
    Click Button  //*[@id="button-payment-method"]
    Wait until page contains element  //*[@id="button-confirm"]

Confirm Purchase
    Click Button  //*[@id="button-confirm"]
    Wait until page contains  Your order has been placed!

Return to Home Page
    Wait until page contains element  //*[@id="content"]/div/div/a
    Click Link  //*[@id="content"]/div/div/a

Test Post-Condition
    Close Browser





