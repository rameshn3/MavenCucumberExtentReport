#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
Feature: OrangehrmLive
Background: 
    Given User is on HRMLogin page "https://opensource-demo.orangehrmlive.com/"
  
   @ValidCredentials
   Scenario: Login with valid credentials
      
    When User enters username as "Admin" and password as "admin123"
    Then User should be able to login successfully and new page open
     
   @InvalidCredentials
   Scenario Outline: Login with invalid credentials
      
    When User enters username as "<username>" and password as "<password>"
    Then User should be able to see error message "<errorMessage>"
     
 Examples:
   | username   | password  | errorMessage                      |
   | Admin      | admin12$$ | Invalid credentials               |
   | admin$$    | admin123  | Invalid credentials               |
   | abc123     | xyz$$     | Invalid credentials               |
   
   
   @MissingUsername
   Scenario Outline: Login with blank username
       
    When User enters username as " " and password as "admin123"
    Then User should be able to see a message "Required" below Username
       
   @FaceBookLink @FailedTest
   Scenario: Verify FaceBook Icon on Login Page
      
    Then User should be able to see FaceBook Icon
     
   @LinkedInLink
   Scenario: Verify LinkedIn Icon on Login Page
      
    Then User should be able to see LinkedIn Icon  
     
   @ForgetPasswordLink
   Scenario: Verify ForgetPassword link on Login Page
      
    When User clicks on Forgot your Password Link
    Then User should navigate to a new page
    
  #  @database
 #   Scenario: Connect to the database and fetch the data
 #   Given create database connection
 #   When execute the query
  #  Then should see the results