*** Settings ***
Library    SeleniumLibrary
Resource  ${EXECDIR}/Resources/keywords.robot
Resource  ${EXECDIR}/Inputs/testInputs.robot
Test Teardown  close all browsers

*** Test Cases ***
Test1_TitleTest
   startBrowserAndAccessSpecifiedPage  ${home_page_url}
    verifyTitle  ${page_title}

Test2_ValidAdminLogin
    startBrowserAndAccessSpecifiedPage  ${home_page_url}
    InputValidUsernamePasswordAndSubmit  ${admin_username}  ${admin_password}
    checkHomePageWithSpecifiedUsername  ${admin_username}

Test3_ValidGeneralUserLogin
    startBrowserAndAccessSpecifiedPage  ${home_page_url}
    InputValidUsernamePasswordAndSubmit  ${general_username}  ${general_password}
    checkHomePageWithSpecifiedUsername  ${general_username}

Test4_AnalyzeData
    startBrowserAndAccessSpecifiedPage  ${analyze_page_url}
    InputValidUsernamePasswordAndSubmit  ${admin_username}  ${admin_password}
    UploadFileAndSelectDataModelToAnalyzeAndConfirmResultPage  ${file_name}  ${model_name}



