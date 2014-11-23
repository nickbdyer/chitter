Feature: Chitter
  In order to satsify my need for gossip
  As a socialable person
  I want to be able to see what people are up to

  Scenario: Visit the homepage with no posts
    Given I am on the homepage
    And there are no posts
    Then I should be told there is nothing to see

  Scenario: Visit the homepage with posts
    Given I am on the homepage
    And there are posts 
    Then I should see the posts
