@login
Feature: Log in LinkedIn Website

  As a LinkedIn user
  I want to type username and password
  So that I can login to system

  @wrongpasword
  Scenario Outline: Login to LinkedIn Profile with wrong informations
    Given I am at linkedin login page
    When I type wrong username: "<username>" and random password: "<password>"
    Then I get "<error>"

    Examples:
      | username   | password | error                                                                                     |
      | username   | 1234567  | Hmm, that's not the right password. Please try again or                                   |
      |            | 1234a67  | Please enter a value.                                                                     |
      | random     |          | Please enter a password.                                                                  |
      |            |          | There were one or more errors in your submission. Please correct the marked fields below. |
      | WrongEmail | 12345at7 | Please enter a valid email address.                                                       |
      | random     | 12456sd  | Hmm, we don't recognize that email. Please try again.                                     |

  Scenario: Login to LinkedIn Profile with correct information
    Given I am at linkedin login page
    When I type username: "ahmet233@gmail.com" and password: "kuberwr"
    Then I can see my username: "Berna Gökçe"




