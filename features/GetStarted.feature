Feature: Allow guests to play game without logging in

Scenario: Playing game without logging in
  When I click on 'Get Started' button
  Then I should be able to the play the game for up to 10 questions
