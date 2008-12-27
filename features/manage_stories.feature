Feature: Manage stories
  In order to have possibility of manage requirments
  developer and client
  wants to write stories
  
  Scenario: Register new story
    Given the following features:
      |title|in_order_to|
      |title 1|in_order_to 1|
    And I am on the new story page
    When I fill in "Title" with "title 1"
    And I fill in "Description" with "description 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "description 1"

  Scenario: Delete story
    Given the following features:
      |title|in_order_to|
      |title 1|in_order_to 1|
    And the following stories:
      |title|description|
      |title 1|description 1|
      |title 2|description 2|
      |title 3|description 3|
      |title 4|description 4|
    When I delete the 3rd story
    Then I should see the following stories:
      |title|description|
      |title 1|description 1|
      |title 2|description 2|
      |title 4|description 4|
