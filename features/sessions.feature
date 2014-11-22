Feature: Sessions
  In order to make posts
  As a security concious user
  I want to sign in before posting

  Scenario: User sign in with correct information
    Given I am on the homepage
    And I am not signed in
    Then I should sign in

  Scenario: User sign in with incorrect information
    Given I am on the homepage
    And I am not signed in
    And I try to sign in
    Then I should be told my information was incorrect
