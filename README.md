# README

*OBJECTIVE*

## Design an application that will provide the following routes:
    - Add transactions for a specific payer and date.
    - Spend points using the rules above and return a list of { "payer": <string>, "points": <integer> } for each call.
    - Return all payer point balances.

## A transaction is defined with the following properties: 
 - Each transaction record contains: payer (string), points (integer), timestamp (date)

## There were two rules specified for spending as detailed below:
    - We want the oldest points to be spent first (oldest based on transaction timestamp, not the order they’re received)
    - We want no payer's points to go negative.
    
## Requirements
- Ruby 2.7.4
- NodeJS (v16), and npm

Verify which version of Ruby you're running by entering this in the terminal:

"ruby -v"


you can use `rvm` to install a newer version of Ruby:

"rvm install 2.7.4 --default"

You should also install the latest versions of `bundler` and `rails`:

"gem install bundler"
"gem install rails"

## System dependencies 
- Please copy and paste the following commands into the Gemfile:
    gem 'active_model_serializers'

## Database creation: 
- The default SQLite database was used for the purpose of this project. No action should be required.

## Running the application:

You can use the following commands to run the application:

- After cloning the repository to a local repository:
    - Please note the system dependencies and requirements marked above, run `bundle install` when completed.
    - Run: `rails db:migrate` to initialize the database
    - Run: `rails s`: run the backend on [http://localhost:3000](http://localhost:3000)

Postman was used to develop and test the backend. The link can be found here [https://www.postman.com/downloads/]

The `create` call can be called with the following route:
"/transactions/:payer/:points/:timestamp"
for example:
"/transactions/dannon/3000/"2020-11-02T14:00:00Z"

The `spend` call can be called with the following route:
"/spend:points"
for example:
"/spend/3000"

The `points_balance` route can simply be called with the following route:
"/points_balance"

**For information of fetch routes, please refer to the routes.rb file located in the config folder**

**it should be noted that the data will persist**

*to reset the data please enter "rails db:reset" into the console*

## For more information regarding how the routes are handled, please refer to the controllers folder under the apps folder

## For more information on how data is displayed, please reference the serializers folder in the apps folder

## For more information on the tables in the database please reference the migrate folder in the db folder