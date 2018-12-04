Feature: User can create feedback and rate the website

  Background: I am on the question page

    Given the following users have been added to the User database:
      | id  | first_name  | last_name  | email  | encrypted_password  | admin  | score |
      |  1  | Robin       | Hood       | xxx@gmail.com | 123456       |   f    |  10   |
      |  2  | Thomas      | Edison     | yyy@gmail.com | 234567       |   f    |  20   |
      |  3  | Frank       | Robert     | temp@gmail.com | 345678      |   f    |  15   |

    And I am on the question page

  Scenario: User create feedback
    When I log in with valid user credentials
    And I click on Submit feedback link
    Then I should be redirected to a feedback page
