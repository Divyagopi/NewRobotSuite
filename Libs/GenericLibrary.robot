*** Settings ***
Resource          ../Resources/common.robot

*** Variables ***
${IN_testsheetname}    Testdata1
${rownum}         ${EMPTY}
${colNum}         ${EMPTY}
${IN_Username}    ${EMPTY}
${IN_Password}    ${EMPTY}
${IN_Message}     ${EMPTY}
${errormessage}    xpath=.//*[@id='login-form']/div[1]/div/div
${TestdataFile}    D:\\Sample_RobotExample\\Testdata\\Testdata.xls
${username}       xpath=//input[@id='id_email']
${password}       xpath=//input[@id='id_password']
${rowlocator}     //div[@class='overflow-width']/table/tbody/tr
${celltext}       DHFL
${Dragsource}     xpath=.//*[@id='sample']/div[1]/span[1]/div/div[1]
${Droptarget}     xpath=.//*[@id='myDiagramDiv']/canvas

*** Keywords ***
Get cell value from excel
    [Arguments]    ${sSheetName}    ${sTestCaseNo}    ${sColumnName}
    log    ${sColumnName}
    ${colCount}    Get Column Count    ${sSheetName}
    Log    ${colCount}
    : FOR    ${y}    IN RANGE    0    ${colCount}
    \    ${header}    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${y}    0
    \    Log    ${header}
    \    #Check if this is the given header
    \    Run Keyword If    "${header}"=="${sColumnName}"    Set Test Variable    ${colNum}    ${y}
    Log    "column number is" ${colNum}
    #Get the total rows in the Sheet
    ${iTotalRows}    ExcelLibrary.Get Row Count    ${sSheetName}
    Log    "Row number is" ${iTotalRows}
    : FOR    ${iRowNo}    IN RANGE    0    ${iTotalRows}
    \    ${TC_Num}    Read Cell Data By Coordinates    ${sSheetName}    0    ${iRowNo}
    \    #Incase TestCase No is same , fetch the data from same row and given column No
    \    ${sSearchedData}    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    ExcelLibrary.Read Cell Data By Coordinates    ${sSheetName}    ${colNum}
    \    ...    ${iRowNo}
    \    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Exit For Loop
    [Return]    ${sSearchedData}

Test Intialization
    [Arguments]    ${rownum}    ${testsheetname}
    open excel    ${TestdataFile}
    Set Global Variable    ${rownum}    ${rownum}
    ${username}=    Get cell value from excel    ${testsheetname}    ${rownum}    Username
    Set Suite Variable    ${IN_Username}    ${username}
    Log    ${IN_Username}
    ${password}=    Get cell value from excel    ${testsheetname}    ${rownum}    Password
    Set Suite Variable    ${IN_Password}    ${password}
    Log    ${IN_Password}
    ${message}=    Get cell value from excel    ${testsheetname}    ${rownum}    Message
    Set Suite Variable    ${IN_Message}    ${message}
    Log    ${IN_Message}
