Feature: Allow user to add question

  Background: User is logged in
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |

    And I am logged in

    Scenario: User wants to add a question
      When I click on add question with details
      Then I should get a successful message of adding a question

    Scenario: User clicks on add question button without entering any details
      When I click on add question button without entering any details
      Then I should get a warning message

    Scenario: User wants to come back to the question page
      When I click on back to question button on add question form
      Then I should be redirected to the questions page

    Scenario: User skips one of the fields while adding a question
      When I skip one of the fields while adding a question
      Then I should get a warning message

    Scenario: User clicks on log out button on add question page
      When I click on log out button on add question page
      Then I should see a sign out message
