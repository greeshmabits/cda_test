*** Settings ***
Library    Collections
Library    SeleniumLibrary


*** Variables ***
${page_title}  ChemometricsDataAnalyzer
${home_page_url}    http://localhost:3000/
${analyze_page_url}  http://localhost:3000/loggedin/analyzeData
${file_name}  Inputs/DataSample_1.csv
${model_name}  model1_pls
${browser}    headlesschrome
#Login
${admin_username}  admin
${admin_password}  admin@123
${general_username}  gen1
${general_password}  user@123

#New user creation input
@{user_details1}  autouser1  user1f  user1l  Admin  user1gg@gmail.com  user1
@{user_details2}  autouser2  user2f  user2l  General  user2gg@gmail.com  user2
@{user_details3}  autouser3  user3f  user3l  Admin  user3gg@gmail.com  user3

