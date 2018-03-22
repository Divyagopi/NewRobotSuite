*** Settings ***
Test Teardown     Close All Browsers
Library           robot.libraries.Process
Resource          ../Resources/common.robot

*** Variables ***
${MESSAGE}        Hello, World
${status}         ${Empty}
${Targetpath}     D:\\Sample_RobotExample\\Testoutput.xls
${uploadpath}     D:\\Users\\gkothako\\Desktop\\printTicket.pdf
${Source}         css=#div1
${Destination}    css=#div2

*** Test Cases ***
Testcase1
    [Tags]    smoke
    Open Browser    http://google.co.in    chrome    # Google urls
    sleep    5s
    #Maximize Browser Window
    wait until element is visible    xpath=//div[@id='hplogo']/canvas
    Input Text    css=#lst-ib    "RobotFramework"
    Click Element    css=input[name="btnK"]
    Click link    xpath=//a[contains(text(),'Robot Framework')]
    capture page screenshot
    ${a}=    set variable    Hello
    ${b}    ${c}=    set variable    10.56    22.2
    Log to console    ${a},${b},${c}
    ${result}=    Evaluate    ${b}+${c}
    Log    "Result is "+${result}
    set global variable    ${abcd}    testing suite

Testcase2
    [Tags]    smoke    sanity
    #    ${MESSAGE}
    #CheckMessage    ${MESSAGE}
    #: FOR    ${INDEX}    IN RANGE    1    10
    #\    Log    ${INDEX}
    #\    ${RANDOM_STRING}=    Generate Random String    ${INDEX}
    #\    Log    ${RANDOM_STRING}
    #@{ITEMS}    Create List    Good Element 1    Break On Me    Good Element 2
    #: FOR    ${ELEMENT}    IN    @{ITEMS}
    #\    Log    ${ELEMENT}
    #\    Run Keyword If    '${ELEMENT}' == 'Break On Me'    Exit For Loop
    #\    Log    Do more actions here ...
    #${Some_value}=    set variable    "one two three"
    #@{words}    Split String    ${Some_value}    ${SPACE}
    #: FOR    ${value}    IN RANGE    0    3
    #\    ${text}=    Get From List    ${words}    ${value}
    #\    Log    ${text}
    #${EMPTY}
    #Log to console    ${abcd}
    ${status}    Run keyword and Ignore error    should be equal as strings    testing suite    testing suite
    Log to console    ${status}

Tescase3
    [Tags]    smoke
    Open Excel    ${Filename}
    ${rc}=    Get Row Count    Testdata1
    #${Names}= \ \ \ \    Get Sheet Names
    Log to console    "Row count is " ${rc}
    ${Cc}=    Get Column Count    Testdata1
    Log to console    "Coloumn count is " ${Cc}

Testcase4
    [Tags]    smoke
    Test Intialization    1    Sheet1
    Open Application
    Login to Application
    Sleep    3s
    ${Message1}=    Get Text    ${errormessage}
    Log    ${Message1}
    Should be equal as strings    ${Message1}    ${IN_Message}    #${result}=    Convert to Number    ${rownum}    #${rowsval}=
    ...    # convert to Integer    ${result}    #Log to console    ${rowsval}    #Run Keyword If    "${status}" == "PASS"
    ...    # Put Date To Cell    ${IN_testsheetname}    ${colNum}    ${rowsval}    Pass    # ELSE
    ...    # Put Date To Cell    ${IN_testsheetname}    ${colNum}    ${rowsval}    Fail
    #ExcelLibrary.save_excel    ${Targetpath}
    Close all Browsers

Testcase5
    [Tags]    smoke
    #${result}=    Convert to Number    1.2
    #${result1}=    convert to Integer    ${result}
    #Log to console    ${result1}
    #Open Browser    https://www.udemy.com/    chrome
    #Maximize Browser Window
    #Mouse over    CSS=span[data-purpose='browse-courses-link']
    #Mouse over    xpath=//span[contains(text(),"IT & Software")]
    #Click Element    xpath=//span[contains(text(),"Other")]
    ${data}=    GET File    D:\\Sample_RobotExample\\Robot.bat    #Read files
    Log    ${data}
    #${ExpLine1}=    Get Line    ${data}    1    #Get Line values
    #Log    ${ExpLine1}
    #${ExpLine2}=    Get Line    ${data}    2    #Get Line values
    #Log    ${ExpLine2}
    #Run Process    C:\\Windows\\System32\\cmd.exe
    ${result2}=    Run process    D:\\Sample_RobotExample\\Robot.bat
    #should be equal as integers    ${result2}    0
    #should be equal as strings    ${ExpLine1}    test    #compare expect values with actual value
    #should be equal as strings    ${ExpLine2}    test1    #compare expect values with actual value
    attach file

Testcase6
    [Tags]    smoke
    Test Intialization    2    Sheet1
    Open Application
    Login to Application
    Sleep    3s
    ${Message1}=    Get Text    ${errormessage}
    Log    ${Message1}
    Should be equal as strings    ${Message1}    ${IN_Message}
    #ExcelLibrary.save_excel    ${Targetpath}

Testcase7
    [Tags]    smoke
    Open browser    https://www.3ds.com/products-services    ${Browser}
    Maximize browser window
    mouse over    xpath=//li[@id='menu-13621']/a[contains(text(),'Products & Services')]
    Sleep    1s
    mouse over    xpath=.//*[@id='menu-13621']/div/ul/li[9]/a
    Click Element    Xpath=.//*[@id='menu-13621']/div/ul/li[9]/div/ul/li[1]/a

Testcase8
    [Tags]    smoke
    Open Browser    http://www.deal4loans.com/home-loans-interest-rates.php    ${Browser}
    Maximize browser window
    Execute JavaScript    window.scrollTo(0,0)
    Sleep    3s
    ${rowIndex}    Get Row By Cell Text    ${rowlocator}    ${celltext}    1
    Click Link in Table Cell    ${rowlocator}    ${rowIndex}    1

Testcase9
    [Setup]    Start Sikuli Process
    #open Browser    https://gojs.net/latest/samples/htmlDragDrop.html    ${Browser}
    #Maximize browser window
    #mouse over    ${Dragsource}
    #Drag And Drop    ${Dragsource}    ${Droptarget}
    #Sleep    2s
    #capture page screenshot
    Open Browser    http://html5demos.com/drag    chrome
    Maximize Browser Window
    Sleep    2
    #Mouse over    css=#one
    SikuliLibrary.Drag and Drop    D:\\Sample_RobotExample\\images\\source.png    D:\\Sample_RobotExample\\images\\target.png
    #Drag and drop by offset    css=#one    60    -10
    #Drag And Drop By Offset    css=#one    -220    0
    #Drag And Drop By Offset    css=#two    220    0

Testcase10
    [Tags]    smoke
    [Setup]    Start Sikuli Process
    open browser    https://imgur.com/    chrome
    Maximize Browser window
    click Element    xpath=.//*[@id='topbar']/div/span[2]/a/span[2]
    sleep    3s
    #SikuliLibrary.right click    /images/Browse.png
    Click Element    xpath=.//*[@id='upload-modal']/div[2]/div[2]/label
    Sleep    6s
    #SikuliLibrary.Click    /mages/Open.png
    SikuliLibrary.Input Text    D:\\Sample_RobotExample\\images\\Input2.png    D:\\download_itil.gif
    #Press Special Key    ENTER
    Sleep    2s
    SikuliLibrary.Click    D:\\Sample_RobotExample\\images\\open1.png

Testcase11
    [Tags]    smoke
    [Setup]    Start Sikuli Process
    #open Browser    https://gojs.net/latest/samples/htmlDragDrop.html    ${Browser}
    #Maximize browser window
    #mouse over    ${Dragsource}
    #Drag And Drop    ${Dragsource}    ${Droptarget}
    #Sleep    2s
    #capture page screenshot
    Open Browser    http://www.w3schools.com/html/html5_draganddrop.asp    firefox
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=.//*[@id='div2']
    Sleep    2
    #Mouse over    css=#one
    #SeleniumLibrary.Drag and Drop    ${Source}    ${Destination}
    Sleep    2s
    SeleniumLibrary.Mouseover    ${Source}
    sleep    2s
    SeleniumLibrary.Mouseup    ${Source}
    #SeleniumLibrary.Mouse Up    xpath=.//*[@id='div2']
    #SeleniumLibrary.Click Element    xpath=.//*[@id='div2']
    #Drag and drop by offset    css=#one    60    -10
    #Drag And Drop By Offset    css=#one    -220    0
    #Drag And Drop By Offset    css=#two    220    0

*** Keywords ***
CheckMessage
    [Arguments]    ${MSG}
    should be equAL    ${MSG}    Hello, World

Open Application
    Log    Open the application
    Open Browser    https://www.udemy.com/    chrome
    wait until Element Is visible    css=img.udemy-logo

Login to Application
    wait until Element Is visible    css=img.udemy-logo
    Click Element    css=a.btn.btn-quaternary
    Sleep    10s
    Input Text    ${username}    ${IN_Username}
    Sleep    2s
    Input Text    ${password}    ${IN_Password}
    sleep    2s
    capture page screenshot
    Click Element    xpath=.//*[@id='submit-id-submit']
    capture page screenshot
    #${Out_status}    ${value}=    Run Key Word and Ignore error    wait until Element Is visible    css=span.user-initials
    #set suite variable    ${status}    ${Out_status}

Get table row count
    [Arguments]    ${rowlocator}
    Run keyword and return    Get Matching xpath count    ${rowlocator}

Get Row By Cell Text
    [Arguments]    ${rowLocator}    ${cellText}    ${column}
    ${rowcount}    Get table row count    ${rowLocator}
    : FOR    ${rowIndex}    IN RANGE    2    ${rowcount}+1
    \    ${curtext}    Get Text    ${rowLocator}[${rowIndex}]/td[${column}]/a/b
    \    Exit for Loop If    '${curtext}' == '${cellText}'
    ${rownumber}    set variable    ${rowIndex}
    [Return]    ${rownumber}

Click Link in Table Cell
    [Arguments]    ${rowLocator}    ${row}    ${column}
    Click Element    ${rowLocator}[${row}]/td[${column}]/a/b
    Sleep    3s
    capture page screenshot
