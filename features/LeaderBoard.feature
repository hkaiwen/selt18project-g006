Feature: Display top 10 players along with their scores

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

   Scenario: User clicks on leaderboard
     When I click on leaderboard
     Then I should see a display of top 10 players

   Scenario: User click go back button
     When I am on leaderboard page and click on back button
     Then I am on the question page

   Scenario: Login/Logout function on Leaderboard page
     When I click on leaderboard
     Then I log in with valid user credentials
     Then I should see a successful login message
     Then I click on log out
     Then I should see a sign out message
