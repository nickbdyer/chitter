Feature: Sessions
  In order to make posts
  As a security concious user
  I want to sign in before posting

  Scenario: User sign in
    Given I am on the homepage
    And I am not signed in
    Then I should sign in