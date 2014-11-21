Feature: Chitter
  In order to let people know what I'm up to
  As a socialable person
  I want to be able to tell people what I'm doing

  Scenario: Visit the homepage with no posts
    Given I am on the homepage
    And there are no posts
    Then I should be told there is nothing to see

  Scenario: Visit the homepage with posts
    Given I am on the homepage
    And there are posts 
    Then I should see the posts