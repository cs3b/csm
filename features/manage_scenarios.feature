Feature: Manage scenarios
  In order to have possibility of manage requirments
  developer and client
  wants to write stories
  
  Scenario: Register new scenario
    Given I am on the new scenario page
    When I fill in "Title" with "Register new scenario"
    And I fill in "Given" with "I am on the new scenario page"
    And I fill in "When" with "I fill all required fields And I press 'Create' button"
    And I fill in "Then" with "I should see notice that new scenario is created 
    And I should be redirected to show scenario page"
    And I press "Create"
    Then I should see "Scenario created successfull"
    And I should see "Register new scenario"
    And I should see "Given" with "I am on the new scenario page"
    And I should see "I fill all required fields And I press 'Create' button"
    And I should see "I should see notice that new scenario is created And I should be redirected to show scenario page"

  Scenario: Delete scenario
    Given the following scenarios:
      |content|parent_id|position|type|
      |Scenario||1|1|
      |I am on the new scenario page|Register new scenario|1|2|
      |I press 'Create' button|Scenario|2|3|
      |I should see 'new scenario is created'|Scenario|3|4|
      |Scenario2||1|1|
      |I am on the new scenario page|Register new scenario2|1|2|
      |I press 'Create' button|Scenario2|2|3|
      |I should see 'new scenario is created'|Scenario2|3|4|
      |Scenario3||1|1|
      |I am on the new scenario page|Scenario3|1|2|
      |I press 'Create' button|Scenario3|2|3|
      |I should see 'new scenario is created'|Scenario3|3|4|
    When I delete the 2rd scenario
    Then I should see the following scenarios:
      |Scenarios|
      |Scenario|
      |Scenario3|
