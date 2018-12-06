Feature: User can view feedback on the show feedback page

  Background: I am on the submit feedback page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |  hard   |

    Given the following users have been added to the User database:
      | id  | first_name  | last_name  | email          | password  | admin  | score |
      |  1  | Robin       | Hood       | xxx@gmail.com  | 123456    |   f    |  10   |
      |  2  | Thomas      | Edison     | yyy@gmail.com  | 234567    |   f    |  20   |
      |  3  | Frank       | Robert     | temp@gmail.com | 345678    |   f    |  15   |

    Given the following feedbacks have been added to the Feedback database:
      | id  | feedback_text                    | user_id  | created_at | updated_at | rating |
      |  1  | This app helps me al lot!        | 1        | Time.now   | Time.now   |   5    |
      |  2  | It lacks of instructions         | 2        | Time.now   | Time.now   |   3    |
      |  3  | I hope I can see my own rank     | 3        | Time.now   | Time.now   |   4    |

    And I am on the question page
    And I log in with valid user credentials
    And I go to submit feedback page

  Scenario: User goes to show feedback page by clicking show feedback button
    When I click on show feedback button
    Then I should see 3 feedbacks on show feedback page

  Scenario: User goes back by clicking on back button
    When I click on show feedback button
    And I click on back button
    Then I should be redirected to a feedback page

  Scenario: Log out when user on feedback page
    When I click on show feedback button
    And I click on log out
    Then I should see a sign out message
