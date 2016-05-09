@updating
Feature: Updating status

  As a LinkedIn user
  I want to change my current status
  So that people can reach me with my new status

  @correct
  Scenario: Updating new status with all correct informations
    Given I am at my linkedin profile
    When I type textplane : "Graduate QA" , select : "Public" and upload a picture
    Then I can see my status: "Graduate" and button: "Like"

  @empty
  Scenario: Updating new status without writing anything
    Given I am at my linkedin profile
    When I do nothing
    Then I should still see Status field

  @blank
  Scenario: Share blank status
    Given I am at my linkedin profile
    When I comment "    "
    Then I should still see Status field

  @javascript
  Scenario: Trying java script codes
    Given I am at my linkedin profile
    When I comment js: " <s> " and select : "CONNECTIONS"
    Then I should see it as a status on my profile

  Scenario: Finding limit of text file
    Given I am at my linkedin profile
    When I type "601" characters to field "field_name"
    Then I can see error : "You have exceeded the maximum length by"