Feature: User can create feedback and rate the website

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |  hard   |

    Given the following users have been added to the User database:
      | id  | first_name  | last_name  | email  | password  | admin  | score |
      |  1  | Robin       | Hood       | xxx@gmail.com | 123456       |   f    |  10   |
      |  2  | Thomas      | Edison     | yyy@gmail.com | 234567       |   f    |  20   |
      |  3  | Frank       | Robert     | temp@gmail.com | 345678      |   f    |  15   |

    And I am on the question page

  Scenario: User go to feedback form when click on submit feedback
    When I log in with valid user credentials
    And I click on Submit feedback
    Then I should be redirected to a feedback page

  Scenario: Database save user feedback when user click on submit
    When I log in with valid user credentials
    And I click on Submit feedback
    And I fill in my feedback
    Then my feedback should be saved in the database

  Scenario: Page gives error if user submits feedback without filling in the rating
    When I log in with valid user credentials
    And I click on Submit feedback
    Then the page should give error message if I don't give the rating

  Scenario: Log out when user on feedback page
    When I log in with valid user credentials
    And I click on Submit feedback
    And I click on log out
    Then I should see a sign out message

  Scenario: User wants to come back to the question page
    When I log in with valid user credentials
    And I click on Submit feedback
    Then I click on back to question button on feedback form
    Then I should be redirected to the questions page


  Scenario: Feedback is stored even when users only give rating
    When I log in with valid user credentials
    And I click on Submit feedback
    And I give a rating without a comment
    Then my feedback should be saved in the database

