Feature: Updating status

  As a LinkedIn user
  I want to change my current status
  So that people can reach me with my new status

  Scenario:
    Given I am at my linkedin profile
    When I activate Update Status tab
    And I type textplane : "Graduate QA" and select : "Public"
    And upload a picture
    And I click Share button
    Then I can see my status: "Graduate" and button: "Like"

  Scenario:
    Given I am at my linkedin profile
    When I activate Update Status tab
    And I do nothing
    And I click Share button
    Then I should still see Status field
