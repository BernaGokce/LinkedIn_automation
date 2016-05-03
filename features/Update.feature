Feature: Updating status

  As a LinkedIn user
  I want to change my current status
  So that people can reach me with my new status

  Scenario:
    Given I am at my linkedin profile
    When I click Update Status
    And I type textplane : "Graduate QA"
    Then I can see my new post on my profile