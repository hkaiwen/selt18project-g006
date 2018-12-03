Feature: Allow user to select the levels when the user is logged in

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          Easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   Medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                   |Hard      |

    And I am on the WordPower Page

  Scenario: User should not see select button without logging in
    When I click on 'Get Started' button
    Then I should not see Select button on questions page


  Scenario: User should not see scores without logging in
    When I click on 'Get Started' button
    Then I should not see Scores on questions page

  Scenario: User should not see levels without logging in
    When I click on 'Get Started' button
    Then I should not see levels on questions page

  Scenario: User selects Easy level when logged in and plays the game
    When I log in with valid user credentials
    Then I select Easy level
    Then I should get a question based on Easy level

