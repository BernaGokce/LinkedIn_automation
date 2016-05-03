Feature: Checking Profile

  As a linkedIn user
  I want to add new education information
  So that people can see my latest version of cv

  Scenario:
    Given I am at my linkedin profile
    When I add new position
    And  I type school: "Sehir" , degree: "3.70" , field: "computer science" and description: "hello"
    Then I can see my new experience on my profile


