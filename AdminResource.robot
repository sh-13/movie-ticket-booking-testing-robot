*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${adminurl}  http://localhost/ticket/admin/
${theatreurl}   http://localhost/ticket/theatre/
${browser}  chrome


*** Keywords ***
Login to admin portal
    Open Browser    ${adminurl}index.php    ${browser}
    Input Text    Email    admin
    Input Text    Password    password
    Click Button    login
    Page Should Contain    Movies List

Login to theatre portal
    [Arguments]  ${email}  ${password}
    Open Browser    ${theatreurl}index.php  ${browser}
    Input Text    Email    ${email}
    Input Text    Password    ${password}
    Click Button    login

Theatre registration
    [Arguments]  ${name}  ${address}  ${place}  ${state}  ${pin}  ${username}  ${password}
    Input Text    name    ${name}
    Input Text    address    ${address}
    Input Text    place    ${place}
    Input Text    state    ${state}
    Input Text    pin    ${pin}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Click Button    submit

Upcoming movie details
    [Arguments]  ${name}  ${cast}  ${date}  ${description}  ${imagepath}
    Input Text    name    ${name}
    Input Text    cast    ${cast}
    Input Text    date    ${date}
    Input Text    description    ${description}
    Input Text    attachment    ${imagepath}

Released movie details
    [Arguments]  ${name}  ${cast}  ${rdate}  ${desc}  ${imagepath}  ${videolink}
    Input Text    name    ${name}
    Input Text    cast    ${cast}
    Input Text    rdate    ${rdate}
    Input Text    desc    ${desc}
    Input Text    image    ${imagepath}
    Input Text    video    ${videolink}

Screen details
    [Arguments]  ${name}  ${seats}  ${charge}
    Click Button    id:addscreen
    Sleep    1
    Input Text    name    ${name}
    Input Text    seats    ${seats}
    Input Text    charge    ${charge}
    Click Button    id:savescreen
    Reload Page

Show timing details
    [Arguments]  ${screenname}  ${type}  ${time}
    Click Button    addshowtime,${screenname}
    Sleep    1
    Select From List By Label    s_name    ${type}
    Input Text    s_time    ${time}
    Click Button    id:savetime
    Reload Page

Show details
    [Arguments]  ${movie}  ${screen}  ${time}  ${date}
    Select From List By Label    movie    ${movie}
    Select From List By Label    screen    ${screen}
    IF    """${time}""" == """all"""
        Select All From List    id:stime
    ELSE
         Select From List By Label    id:stime    ${time}
    END
    Input Text    sdate    ${date}
    Click Button    addshow

Start show
    [Arguments]  ${movie}  ${screen}  ${time}
    Click Button    ${movie}_${time}_${screen}_start

Pause show
    [Arguments]  ${movie}  ${screen}  ${time}
    Click Button    ${movie}_${time}_${screen}_pause

Stop show
    [Arguments]  ${movie}  ${screen}  ${time}
    Click Button    ${movie}_${time}_${screen}_stop

Logout from portal
    Click Element    //nav[@class="navbar navbar-static-top"]//div//ul/li[1]
    Click Element    //nav[@class="navbar navbar-static-top"]//div//ul/li[1]//ul/li[2]//div
    Close Browser