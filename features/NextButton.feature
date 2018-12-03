Feature: Allow skipping to new question

  Background: I am on question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level  |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                         easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |  medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                    | hard   |
    And I am on the question page

  Scenario: Generate new question everytime user clicks Next
    When I click on 'Next' button
    Then I should get a new question
