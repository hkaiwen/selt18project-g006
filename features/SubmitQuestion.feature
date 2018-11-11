Feature: Show whether answer is correct or incorrect when user submit

  Background: I am on question page
    Given the following questions have been added to Question:
      | questions                       | answer      | option2   | option3    | option4    | explanation |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |
      | plethora means                  | excess      | function  | happy      | already    | excess. superflui                                                                                                                                    |
    And I am on the question page

  Scenario: display question and options correctly
    Then I should see a question and 4 options

  Scenario: show answer is correct if submitted answer is correct
    When I select the correct answer
    Then I should see 'Great! Your answer is correct' on flash message

  Scenario: show answer is incorrect if submitted answer is incorrect
    When I select the incorrect answer
    Then I should see 'Sorry, This is the incorrect answer' on flash message
