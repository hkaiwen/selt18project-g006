Feature: Admin can delete question

  Background: I am on the Welcome to WordPower page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                          level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                         easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |  medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    | hard   |

    And I am on the WordPower Page

  Scenario: Admin logs in with valid credentials
    When I log in as an admin
    Then I should be directed to the admin site

  Scenario: Admin can see all questions in the database
    When I log in as an admin
    Then I can see all the question in the database


  Scenario: Admin can delete any question
    When I log in as an admin
    Then I can delete any question from the database
