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
    And I should be asked to correct only the bad information
