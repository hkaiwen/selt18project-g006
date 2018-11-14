Feature: Allow user who logged in to add  a new question

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |

    And I am on the question page

    Scenario: User add new question with logging in
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I fill a new question with all field and submit
      Then I should see 'Question successfully added to question bank' on flash message

    Scenario: User tries to add a new question without explanation with logging in
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I fill a new question without all field and submit
      Then I should see 'Sorry, all fields are required' on flash message

    Scenario: User wants to come back to the question page
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I click on back to question button on add question form
      Then I should be redirected to the questions page

    Scenario: User clicks on log out button on add question page
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      When I click on log out
      Then I should see a sign out message

    Scenario: User clicks on add question button without entering any of the details
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I click on add question button without entering any details
      Then I should see 'Sorry, all fields are required' on flash message
