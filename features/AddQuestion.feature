Feature: Allow user who logged in to add  a new question

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          Easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   Medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |  Hard   |

    And I am on the question page

    Scenario: User add new question with logging in
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I fill in all the fields and submit
      Then I should see 'Question successfully added to question bank' on flash message

    Scenario: User tries to add a new question without question with logging in
     When I log in with valid user credentials
     Then I click on 'Add question to the question bank' button
     Then I fill in all the fields except question and submit
     Then I should see 'question can't be blank' on flash message

   Scenario: User tries to add a new question without answer with logging in
     When I log in with valid user credentials
     Then I click on 'Add question to the question bank' button
     Then I fill in all the fields except answer and submit
     Then I should see 'answer can't be blank' on flash message

  Scenario: User tries to add a new question without option2 with logging in
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I fill in all the fields except option2 and submit
      Then I should see 'option2 can't be blank' on flash message

   Scenario: User tries to add a new question without option3 with logging in
     When I log in with valid user credentials
     Then I click on 'Add question to the question bank' button
     Then I fill in all the fields except option3 and submit
     Then I should see 'option3 can't be blank' on flash message

  Scenario: User tries to add a new question without option4 with logging in
    When I log in with valid user credentials
    Then I click on 'Add question to the question bank' button
    Then I fill in all the fields except option4 and submit
    Then I should see 'option4 can't be blank' on flash message

  Scenario: User tries to add a new question without explanation with logging in
    When I log in with valid user credentials
    Then I click on 'Add question to the question bank' button
    Then I fill in all the fields except explanation and submit
    Then I should see 'explanation can't be blank' on flash message

  Scenario: User tries to add a new question without level with logging in
    When I log in with valid user credentials
    Then I click on 'Add question to the question bank' button
    Then I fill in all the fields except level and submit
    Then I should see 'Please select a level' on flash message

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
      Then I should see 'Sorry, All fields are required' on flash message

    Scenario: User enters only duplicate question without entering other fields
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I enter duplicate question without entering other fields
      Then I should see 'Sorry, All fields are required' on flash message

    Scenario: User enters duplicate question along with other fields
      When I log in with valid user credentials
      Then I click on 'Add question to the question bank' button
      Then I enter duplicate question along with other fields
      Then I should see 'Question has already been taken' on flash message

