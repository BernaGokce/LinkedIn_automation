Feature: LinkedIn User Journey

  As a LinkedIn user
  I want to use Linkedin's different options
  So that People can know about me

  Scenario Outline: Login to LinkedIn Profile
    Given I am at linkedin login page
    When I type wrong username: "<username>" and random password: "<password>"
    Then I get "<error>"
    Examples:
      | username   | password | error                                                                                     |
      | username   | random   | Hmm, that's not the right password.                                                       |
      |            | random   | Please enter a value.                                                                     |
      | random     |          | Please enter a password.                                                                  |
      |            |          | There were one or more errors in your submission. Please correct the marked fields below. |
      | WrongEmail | random   | Please enter a valid email address.                                                       |
      | random     | random   | Hmm, we don't recognize that email. Please try again.                                     |

    Scenario:
      Given I am at linkedin login page
      When I type username: "ahmeffsdf@gmail.com" and password: "k121324q"
      Then I am at my linkedin profile

      Scenario:Publishing post
        Given I am at my linkedin profile
        When I click Publish a post
        And I type head:"QA things" and post: "QA events"
        Then I can see my post on my profile

        Scenario:Updating status
          Given I am at my linkedin profile
          When I click Update Status
          And I type textplane : "Graduate QA"
          Then I can see my new post on my profile

          Scenario:logging out
            Given I am at my linkedin profile
            When I logout
            Then I am at Linkedin home page