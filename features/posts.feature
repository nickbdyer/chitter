Feature: Posts
  In order to let people know what I'm up to
  As an interesting person
  I want to be able to post on Chitter

  Scenario: Adding a post
    Given I am on the homepage
    And I add a post
    Then I should be able to see that post