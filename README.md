# SELT006 Final Project - WordPower

[![Heroku App Status](http://heroku-shields.herokuapp.com/selt18project-g006-sprint3)](https://selt18project-g006-sprint3.herokuapp.com)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.png?v=103)](https://opensource.org/licenses/mit-license.php)


Word power is a simple vocabulary game that draws random questions from the database and 
assign score to users if they answer the question correctly. The game allows users to create account 
to record their score and allow them to add new questions to the database. 10 users with highest
score will be listed in our system leaderboard!

## Implementation

### Ruby Version

2.4.4

###  How to install the app locally

To set up the database, run the commands:

```
bundle install --without production
rake db:create
rake db:migrate
rake db:seed
```

After successfully seeding the database, you can start the app and get to the main page. 


### How to run the test suite

This application uses Cucumber for BDD and Rspec for unit testing. All Cucumber tests are under
`features` folder and Rspec tests are under `spec` folder. We use SimpleCov to measure C0 code coverage. To run 
the test suite, please run the following command

```
bundle exec cucumber 
rake spec
```

### Deployment

This application is deployed through Heroku. Please refer to Heroku documentation if you need 
further guidance on deployment.

