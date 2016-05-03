Feature: Loging out

  As a LinkedIn user
  I want to logout
  So that I can protect my account

  Scenario:

    Given I am at my linkedin profile
    When I logout
    Then I am at Linkedin home page