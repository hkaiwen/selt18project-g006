Feature: Allow the User to sign up

  Background: I am on the Welcome to WordPower page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level  |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                         easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |  medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    | hard   |

    And I am on the WordPower Page

    Scenario: User signs up with valid details
      When I sign up with valid user details
      Then I should see a successful sign up message

    Scenario: User signs up with blank first name
      When I sign up with blank first name
      Then I should see a blank first name error message

    Scenario: User signs up with blank last name
      When I sign up with blank last name
      Then I should see a blank last name error message

    Scenario: User signs up with blank email
      When I sign up with blank email
      Then I should see a blank email error message

    Scenario: User signs up with invalid password
      When I sign up with invalid password
      Then I should see an invalid password message

    Scenario: User signs up without password
      When I sign up with blank password
      Then I should see a blank password error message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with with mismatched password and confirmation
      Then I should see an invalid password mismatch message

    Scenario: User logs in on the sign up page
      When I log in on the sign up page with valid user credentials
      Then I should see a successful login message
