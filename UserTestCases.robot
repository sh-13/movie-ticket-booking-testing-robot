*** Settings ***
Resource    UserResource.robot


*** Test Cases ***
Register_new_user
    User Registration    user  24  male  0461987987  user1@email.com  user1pw  user1pw
    Logout from portal

Invalid_user_login
    Login to user portal    user2@email.com    user2pw
    Page Should Contain    Login Failed!
    Close Browser

Valid_and_invalid_user_login
    Login to user portal    user1@email.com    user1pw
    Page Should Contain    user
    Logout from portal

Movie_ticket_booking
    Login to user portal    user1@email.com    user1pw
    Click Element    //div[@class="nav-wrap"]//ul/li[2]
    # Book ticket for Sakhav movie at Smitha theatre for 10:00 AM tomorrow
    Booking details    Black Panther: Wakanda Forever    City gold    10:00 AM
    Page Should Contain    City gold
    Page Should Contain    Black Panther: Wakanda Forever
    Page Should Contain    10:00 AM
    Click Button    booknow
    # Card details
    Pay with card    user one    1111222233334444    11-11-2024    123
    Click Button    makepayment
    Input Text    otp    123456
    Click Button    makepayment
    Sleep    5
    Page Should Contain    Success
    Logout from portal
