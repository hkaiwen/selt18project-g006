Feature: Allow user to select the levels when the user is logged in

  Background: I am on the question page
    Given the following questions have been added to Question Database:
      | questions                       | answer      | option2   | option3    | option4    | explanation |                                                                                                                                           level   |
      | The opposite of healthy is:     |  sick       | suitable  | modest     | apt        | Healthy means having good health. Its the opposite of sick, but also can mean "doing well" in a general sense |                                          Easy   |
      | wonderful means                 |  fantastic  | average   | direct     | possible   | Wonderful is better than good — its even better than great, like your wonderful luck — finding buried treasure on your very first diving expedition. |   Medium |
      | plethora means                  | excess      | function  | happy      | already    | excess superfluity                                                                                                                                   |Hard      |
      | Store means                     | shop        | house     | building   | office     | a retail establishment selling items to the public                                                                                                   |Easy     |
      | latent means:                   | not presently active    | perfect and complete    | many and varied  | sudden and strong    |    Latent is an adjective that you use to describe something that is capable of becoming active or at hand, though it is not currently so |Medium   |
      | transgression means:            | violation       | compression   | persuasion   |  exemption                                 |A transgression is something that is against a command or law. Whether you are cheating on a test, or cheating on a spouse, you are committing transgressions that are not easily forgiven |Hard    |

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

  Scenario: User selects Medium level when logged in and plays the game
    When I log in with valid user credentials
    Then I select Medium level
    Then I should get a question based on Medium level

  Scenario: User selects Hard level when logged in and plays the game
    When I log in with valid user credentials
    Then I select Hard level
    Then I should get a question based on Hard level

  Scenario: User selects Easy level when logged in and get the scores based on level
    When I log in with valid user credentials
    Then I select Easy level
    Then I select the correct answer
    Then I should see Score: 1 based on level

  Scenario: User selects Medium level when logged in and get the scores based on level
    When I log in with valid user credentials
    Then I select Medium level
    Then I select the correct answer
    Then I should see Score: 2 based on level




