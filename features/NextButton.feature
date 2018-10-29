Feature: Allow skipping to new question

  Scenario: Generate new question everytime user clicks Next
    When I click on 'Next' button
    Then I should be get a new question
