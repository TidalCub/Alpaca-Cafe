Feature: User Sign Up and Login
  As a user
  I want to sign up and login
  So that I can access my account

  Scenario: User Sign Up
    Given I am on the sign up page
    When I fill in the sign up form with valid credentials
    And I click "Sign up"
    And I should see a success message

  @javascript
  Scenario: User Login
    Given I am on the login page
    And I have a user account
    When I fill in the login form with valid credentials
    Then I should be redirected to the home page
    And I should see a welcome message

  @javascript
  Scenario: User Logout
    Given I have a user account
    And I am loged in
    And I am on my account page
    When I click "Log Out"
    And I should see a "Signed out successfully." message
  
  Scenario: User Login with Invalid Credentials
    Given I am on the login page
    And I have a user account
    When I fill in the login form with invalid credentials
    And I click "Log in"
    Then I should see an error message

  Scenario: User Sign Up with Invalid Credentials
    Given I am on the sign up page
    When I fill in the sign up form with invalid credentials
    And I click "Sign up"
    And I should see a "Password is too short (minimum is 6 characters)" message

  @javascript
  Scenario: User Profile
    Given I have a user account
    And I am loged in
    When I click "Account"
    And I should see my profile information

  @javascript
  Scenario: Seeing previous orders
    Given I have a user account
    And I am loged in
    When I click "Account"
    And I should see my profile information
    And I should see my previous orders