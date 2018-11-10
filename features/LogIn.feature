Feature: Allow the User to login

  Background: I am on the Welcome to WordPower page
    Given the following questions have been added to Question:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |

    And I am on the WordPower Page

  Scenario: User logs in with valid credentials
    When I log in with valid user credentials
    Then I should see a successful login message

  Scenario: User logs in with wrong email
    When I log in with wrong email
    Then I should see an invalid login message

  Scenario: User logs in with wrong password
    When I log in with wrong password
    Then I should see an invalid login message

  Scenario: User signs in on the login page
    When I sign in on the login page using valid details
    Then I should see a successful sign up message
