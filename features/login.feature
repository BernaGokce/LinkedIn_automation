Feature: Log in LinkedIn Website

  As a LinkedIn user
  I want to type username and password
  So that I can login to system

  Scenario Outline: Login to LinkedIn Profile
    Given I am at linkedin login page
    When I type wrong username: "<username>" and random password: "<password>"
    Then I get "<error>"
    When I type username: "ahmeffsdf@gmail.com" and password: "k121324q"
    Then I am at my linkedin profile

    Examples:
      | username   | password | error                                                                                     |
      | username   | random   | Hmm, that's not the right password.                                                       |
      |            | random   | Please enter a value.                                                                     |
      | random     |          | Please enter a password.                                                                  |
      |            |          | There were one or more errors in your submission. Please correct the marked fields below. |
      | WrongEmail | random   | Please enter a valid email address.                                                       |
      | random     | random   | Hmm, we don't recognize that email. Please try again.                                     |





