@publishing
Feature:Publishing post

  As a LinkedIn user
  I want to post my opinion about anything
  So that people know my opinion

  Scenario: Publishing new post with all lines

    Given I am at my linkedin profile
    When I type head:"QA things" and post: "QA events"
    Then I can see my post: "Your Posts" and my topic:"QA"