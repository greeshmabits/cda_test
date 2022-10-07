CDA Test Automation:
Automated user acceptance test is implemented with the Robot framework, that makes use of Selenium Library to interact with Web elements. This is a keyword driven framework built on python libraries.
This test is named as CDA_Testsuite and it is integrated with Jenkins for Continuous testing.
Setup:
1.Install robotframework-SeleniumLibrary in the host machine.
2.Add the Robotframework plugin to the Jenkins.
3.Code is kept in the git repository. (https://github.com/greeshmabits/cda_web.git)
4.Chrome browser and Chromedriver should be present in the host machine.
5.Python should be installed in the host machine.

Testcases
There are 4 testcases automated. They are:
1.Verify the title of the ChemometricsDataAnalyzer application homepage.
2.Verify the login for admin .
3.Verify the login for general user.
4.Verify the analyze data feature gives the analysis report.


Automation folder structure is as follows:
Input: All the test inputs are stored in this folder
Readme: user guide on CDA_Automation test suite.
Resources: All the keywords are defined inside this folder
WebElements: All the Web element locators or accessors are inside this folder. 
CDA_Testsuite.robot : This file has all the testcases
.Test result : log.html,output.xml,report.html and screenshot in jpeg for failure scenarios.

Command to execute the test suite
robot CDA_Testsuite.robot

Jenkins Job Configuration
The job is named as cda-test and the description also entered. The other details are as follows:
1.Source code management
Git->Repository URL> https://github.com/greeshmabits/cda_test.git
Credentials>input repository accessible credentials
Branch to build> */master

2.Build
	Execute shell>Command > robot CDA_Testsuite.robot
3.Post-build Actions 
	Publish Robot Framework test results > Advanced>
	Name of archive directory > robot-plugin
	Output xml name > output.xml
	Report html name > report.html
	Log html name > log.html

Test result
Test result will be available after execution as report.html, output.xml and log.html
These results can be pulled to Jenkins using the robot framework plugin.
Jenkins display result as follows:
