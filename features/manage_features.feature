Feature: Manage features
  In order to group stories in case of features
  developer and client
  wants to create features

  Scenario: Register new feature
    Given I am on the new feature page
    When I fill in "Title" with "title 1"
    And I fill in "In order to" with "in_order_to 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "in_order_to 1"

  Scenario: Delete feature
    Given the following features:
      |title|in_order_to|
      |title 1|in_order_to 1|
      |title 2|in_order_to 2|
      |title 3|in_order_to 3|
      |title 4|in_order_to 4|
    When I delete the 3rd feature
    Then I should see the following features:
      |title|in_order_to|
      |title 1|in_order_to 1|
      |title 2|in_order_to 2|
      |title 4|in_order_to 4|

  Scenario: Add new story to feature
    Given the following features:
      |title|in_order_to|
      |title 1|in_order_to 1|
      |title 2|in_order_to 2|
    And I am on the show feature 2nd page
    When I click 'Add Story'
    Then I should see new story form
