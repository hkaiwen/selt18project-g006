Feature: Admin can add/edit/delete question and user

  Background: I am on the Welcome to WordPower page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                          level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                         Easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |  Medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    | Hard   |

    And the following users have been added to User Database:
      |first_name       | last_name       | password    | email |
      | Linh            | Pham            | linh        | linh@gmail.com |
      | Lily            | John            | lily        | lily@gmail.com |
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

  Scenario: Admin can edit any question
    When I log in as an admin
    Then I can edit any question from the database

  Scenario: Admin can add a question
    When I log in as an admin
    Then I can add a question

  Scenario: Admin can't add duplicate question
    When I log in as an admin
    Then I cannot add a question that already in the database

  Scenario: Admin cannot add a question if any of the field is missing
    When I log in as an admin
    Then I cannot add question if any of the field is missing

  Scenario: Admin can add another question if choose save and add another
    When I log in as an admin
    Then I can add another question if choose save and add another

  Scenario: Admin can add another question and edit it if they click on save and edit
    When I log in as an admin
    Then I can add another question and edit it if they click on save and edit

  Scenario: Admin can filter question
    When I log in as an admin
    And I fill in filter for question
    Then I only see questions that contain the word I searched for

  Scenario: Admin can reset filter and see all questions again
    When I log in as an admin
    And I fill in filter for question
    And I remove the filter
    Then I can see all the questions

  Scenario: Admin can go to dashboard if click on admin site button
    When I log in as an admin
    And I click on Admin site link
    Then  I should be directed to the admin site

  Scenario: Admin can play game if he/she goes to home
    When I log in as an admin
    And I click on Home link
    Then I should be able to the play the game

  Scenario: Admin can see all users in the database
    When I log in as an admin
    Then I can see all the user in the database

  Scenario: Admin can't add duplicate user
    When I log in as an admin
    Then I cannot add a user that already in the database

  Scenario: Admin cannot add a user if any of the field is missing
    When I log in as an admin
    Then I cannot add user if any of the field is missing


  Scenario: Admin can create other admin for the application
    When I log in as an admin
    Then I can create account for another admin

  Scenario: Admin can save and create another on click save and add another
    When I log in as an admin
    Then  I can add another admin if choose save and add another

  Scenario: Admin can filter user
    When I log in as an admin
    And I fill in filter for user
    Then I only see users that contain the word I searched for

  Scenario: Admin can logout of their account
    When I log in as an admin
    And I click on Log out link
    Then I should see a sign out message

  Scenario: Admin can see all feedbacks in the database
    When I log in as an admin
    Then I can see all the feedback in the database

