Feature: Display top 10 players along with their scores

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |  hard   |

    Given the following users have been added to the User database:
      | id  | first_name  | last_name  | email  | encrypted_password  | admin  | score |
      |  1  | Robin       | Hood       | xxx@gmail.com | 123456       |   f    |  10   |
      |  2  | Thomas      | Edison     | yyy@gmail.com | 234567       |   f    |  20   |
      |  3  |
    And I am on the question page

   Scenario: User clicks on leaderboard
     When i click on leaderboard
     Then i should see a display of top 10 players
