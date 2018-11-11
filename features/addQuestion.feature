Feature: Allow user who logged in to add new question

  Background: I am on the question page
    Given the following questions have been added to Question:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |

    And I am on the question page

    Scenario: User add new question without logging in
      When I click on 'Add question to the question bank' button
      Then I should see 'You need login to do that' on flash message

  Scenario: User add new question with logging in
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I fill a new question with all field and submit
      Then I should see 'Question successfully added to question bank' on flash message

  Scenario: User add new question missing explanation with logging in
    When I log in with valid user credentials
    Then I click on 'Add question to the question bank' button
    Then I fill a new question without all field and submit
    Then I should see 'Sorry, all fields are required' on flash message
