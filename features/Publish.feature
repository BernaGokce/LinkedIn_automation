Feature:Publishing post

  As a LinkedIn user
  I want to post my opinion about anything
  So that people know my opinion

  Scenario:
    Given I am at my linkedin profile
    When I click Publish a post
    And I type head:"QA things" and post: "QA events"
    Then I can see my post: "Your Posts" and my topic:"QA"