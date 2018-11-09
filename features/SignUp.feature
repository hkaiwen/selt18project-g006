Feature: Allow the User to sign up

  Background: I am on the Welcome to WordPower page
    Given the following questions have been added to Question:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    |

    And I am on the WordPower Page

    Scenario: User signs up with valid details
      When I sign up with valid user details
      Then I should see a successful sign up message

    Scenario: User signs up with blank email
      When I sign up with blank email
      Then I should see an blank email message

    Scenario: User signs up with invalid password
      When I sign up with invalid password
      Then I should see an invalid password message

    Scenario: User signs up without password
      When I sign up with blank password
      Then I should see a missing password message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with with mismatched password and confirmation
      Then I should see an invalid password mismatch message
