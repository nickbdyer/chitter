Feature: Users
  In order to make posts
  As a public image concious user
  I want to be able to make posts under my name

  Scenario: Sign up
    Given I am on the homepage
    And I sign up
    Then I should be asked to sign in

  Scenario: Sign up with non-matching password information
    Given I am on the homepage
    And I sign up with non matching passwords
    Then I should be told my passwords don't match
    And I should be shown the form with name, username and email filled out

  Scenario: Sign up with duplicate email
    Given I am on the homepage
    And I sign up with duplicate email
    Then I should be told my email is already taken
    And I should be shown the form with name and username filled out

  Scenario: Sign up with duplicate username
    Given I am on the homepage
    And I sign up with duplicate username
    Then I should be told my username is already taken
    And I should be shown the form with name and email filled out
