Feature: Allow guests to play game without logging in

  Background: I am on question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                          level  |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                        easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. | medium |
      | plethora means                  | excess      | function  | happy      | already    | excess. superflui                                                                                                                                    | hard   |
    And I am on the question page

  Scenario: Playing game without logging in
    When I click on 'Get Started' button
    Then I should be able to the play the game


  Scenario: User cannot see add new question button without logging in
     When I click on 'Get Started' button
     Then I should not see add question button
