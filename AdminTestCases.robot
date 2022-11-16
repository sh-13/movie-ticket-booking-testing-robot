*** Settings ***
Resource    AdminResource.robot


*** Test Cases ***
Add_new_theatre
    Login to admin portal
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[2]
    Theatre registration    City gold    56 Mitchell Street    Darwin    NT    0800    citygold    citygoldpw
    Page Should Contain    City gold
    Logout from portal

Valid_theatre_login
    Login to theatre portal    citygold    citygoldpw
    Page Should Contain    Theatre Details
    Logout from portal

Invalid_theatre_login
    Login to theatre portal    citygold    citygold
    Page Should Contain    Login Failed!
    Close Browser

Add_upcoming_movie_news
    Login to admin portal
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[3]
    # Movie details
    Upcoming movie details    Harry Potter    Daniel Radcliffe, Emma Watson, Rupert Grint, Michael Gambon, Ralph Fiennes    22-11-2022    Harry, Ron and Hermione race against time to destroy the remaining Horcruxes. Meanwhile, the students and teachers unite to defend Hogwarts against Lord Voldemort and the Death Eaters.    C:/xampp/htdocs/ticket/images/pic20.jpg
    Click Button    addnews
    Logout from portal

Add_movie_in_theatre
    Login to theatre portal    citygold    citygoldpw
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[2]
    Released movie details    Black Panther: Wakanda Forever    Letitia Wright, Lupita Nyongo, Danai Gurira, Angela Bassett, Tenoch Huerta    12-11-2022    Queen Ramonda, Shuri, MBaku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King TChallas death. As the Wakandans strive to embrace their next chapter, the heroes must band together with Nakia and Everett Ross to forge a new path for their beloved kingdom.    C:/xampp/htdocs/ticket/images/blackpanther.jpg    https://www.youtube.com/watch?v=RlOB3UALvrQ
    Click Button    addmovie
    Logout from portal

Add_screens_in_theatre
    Login to theatre portal    citygold    citygoldpw
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[7]
    Screen details    screen1    100    18
    Screen details    screen2    200    25
    Logout from portal

Add_showtime_for_screen_in_theatre
    Login to theatre portal    citygold    citygoldpw
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[7]
    Show timing details    screen1    Noon    10:00
    Show timing details    screen1    Others    18:00
    Show timing details    screen1    Second    15:00
    Show timing details    screen2    Others    18:00
    Logout from portal

Add_show_in_theatre
    Login to theatre portal    citygold    citygoldpw
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[3]
    Show details    Black Panther: Wakanda Forever    screen1    all    12-11-2022
    Show details    Black Panther: Wakanda Forever    screen2    Others( 18:00:00 )    13-11-2022
    Logout from portal

Start_and_stop_show_in_theatre
    Login to theatre portal    citygold    citygoldpw
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[6]
    Start show    Black Panther: Wakanda Forever    screen1    10:00:00
    Start show    Black Panther: Wakanda Forever    screen1    15:00:00
    Start show    Black Panther: Wakanda Forever    screen2    18:00:00
    Stop show    Black Panther: Wakanda Forever    screen1    18:00:00
    Pause show    Black Panther: Wakanda Forever    screen1    15:00:00
    Click Element    //aside[@class="main-sidebar"]//section//ul/li[1]
    Page Should Contain    Black Panther: Wakanda Forever
    Page Should Contain    screen1
    Page Should Contain    10:00:00(Noon)
    Logout from portal
