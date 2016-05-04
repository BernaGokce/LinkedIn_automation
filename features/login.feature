Feature: Log in LinkedIn Website

  As a LinkedIn user
  I want to type username and password
  So that I can login to system

  Scenario Outline: Login to LinkedIn Profile
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

  Scenario:
    Given I am at linkedin login page
    When I type username: "bernagokce@std.sehir.edu.tr" and password: "kubber"
    Then I can see my username: "Berna Gökçe"




