*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url}  http://localhost/ticket/
${browser}  chrome


*** Keywords ***
Login to user portal
    Open Browser    ${url}login.php    ${browser}
    [Arguments]  ${email}  ${password}
    Input Text    Email    ${email}
    Input Text    Password    ${password}
    Click Button    submit

User Registration
    [Arguments]  ${user}  ${age}  ${gender}  ${phone}  ${email}  ${password}  ${c_password}
    Open Browser  ${url}registration.php  ${browser}
    Input Text    name    ${user}
    Input Text    age    ${age}
    Select From List By Value    gender    ${gender}
    Input Text    phone    ${phone}
    Input Text    email    ${email}
    Input Password    password    ${password}
    Input Password    cpassword    ${c_password}
    Click Button    submit

Pay with card
    [Arguments]  ${name}  ${number}  ${date}  ${cvv}
    Input Text    name    ${name}
    Input Text    number    ${number}
    Input Text    date    ${date}
    Input Text    cvv    ${cvv}

Booking details
    [Arguments]  ${moviename}  ${theatrename}  ${time}
    Click Element    ${moviename}
    Click Element    ${theatrename},${time}

Logout from portal
    Click Element    logout
    Close Browser