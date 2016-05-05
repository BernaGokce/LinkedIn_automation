Feature: Updating status

  As a LinkedIn user
  I want to change my current status
  So that people can reach me with my new status

  Scenario: Updating new status with all correct informations
    Given I am at my linkedin profile
    When I activate Update Status tab
    And I type textplane : "Graduate QA" and select : "Public"
    And upload a picture
    And I click Share button
    Then I can see my status: "Graduate" and button: "Like"

  Scenario: Updating new status without writing anything
    Given I am at my linkedin profile
    When I activate Update Status tab
    And I do nothing
    And I click Share button
    Then I should still see Status field


    Scenario: Share blank status
      Given that I am at linkedin page
      When I commment "nil"
      Then Icant post status