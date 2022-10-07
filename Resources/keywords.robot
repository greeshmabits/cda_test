*** Settings ***
Library    SeleniumLibrary
Library  String
Variables    ${EXECDIR}/WebElements/locators.py

*** Variables ***
${long_wait_time}  20
${short_wait_time}  5

*** Keywords ***
checkWebElementIsVisibleAndIsEnabled
    [Arguments]    ${webElement}
    set selenium timeout  ${long_wait_time}
    wait until element is visible  ${webElement}
    wait until element is enabled  ${webElement}
    set selenium timeout  ${short_wait_time}

waitUntilElementIsEnabledAndClick
    [Arguments]    ${element_locator}  ${output_msg}
    checkWebElementIsVisibleAndIsEnabled    ${element_locator}
    element should be enabled  ${element_locator}
    click element    ${element_locator}
    log to console  '${output_msg}' Clicked
    set selenium timeout    ${short_wait_time}

startBrowserAndAccessSpecifiedPage
    [Arguments]  ${url}
    open browser    ${url}    ${browser}    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_argument("--no-sandbox"); add_argument("--disable-extensions"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1200,1100"); add_argument("--allow-running-insecure-content")
    maximize browser window
    set browser implicit wait    ${short_wait_time}
    log to console    Accessed Chemometrics Data Analyzer

verifyTitle
    [Arguments]  ${title}
    title should be    ${title}
    log to console    Title-${title} verified---!

InputValidUsernamePasswordAndSubmit
    [Arguments]  ${username}  ${password}
    checkWebElementIsVisibleAndIsEnabled  ${login_btn}
    input text  ${username_textbox}  ${username}
    input text  ${password_textbox}  ${password}
    waitUntilElementIsEnabledAndClick    ${login_btn}  Login-Button

checkHomePageWithSpecifiedUsername
    [Arguments]  ${name}
    page should contain element  ${welcome_msg_box}
    page should contain  ${name}
    log to console  !----Homepage is displayed successfully with Welcome message for username-${name}------!

UploadFileAndSelectDataModelToAnalyzeAndConfirmResultPage
    [Arguments]    ${file_name}  ${model_name}
    log to console  !--------Checking Analyze feature------!
    choose file  fileupload  ${EXECDIR}/${file_name}
    log to console  !-------File uploaded suucessfully--------!
    waitUntilElementIsEnabledAndClick  //select  Model-dropdown
    waitUntilElementIsEnabledAndClick  //option[text()='${model_name}']  Modelname-${model_name}
    log to console  !------Model-${model_name} selected-----------!
    waitUntilElementIsEnabledAndClick  ${analyze_btn}  Analyze-Btn
    alert should be present  File Uploaded Successfully....Processing Result!
    log to console  !--------File uploaded and request processed ----------!
    wait until element is visible  ${analysis_report}
    page should contain element  ${analysis_report}
    log to console  !---Analysis report generated successfully-----------!


