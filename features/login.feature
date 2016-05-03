Feature: Log in LinkedIn Website


  As a LinkedIn user
  I want to type username and password
  So that I can login to system

  Scenario:
    Given I am at linkedin login page
    When I type username: "ahmeffsdf@gmail.com" and password: "k121324q"
    Then I am at my linkedin profile
