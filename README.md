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

```sh
ruby -v
```

you can use `rvm` to install a newer version of Ruby:

```sh
rvm install 2.7.4 --default
```

You should also install the latest versions of `bundler` and `rails`:

```sh
gem install bundler
gem install rails
```

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

When formatting the data for each call to the server, the specifications from the prompt were followed with the exception of adding transactions. An array was used to allow multiple entries to be added quickly.

Please format input to `create` as follows:

    { "transactions":
        [
        { "payer": "DANNON", "points": 1000, "timestamp": "2020-11-02T14:00:00Z" },
        { "payer": "UNILEVER", "points": 200, "timestamp": "2020-10-31T11:00:00Z" },
        { "payer": "DANNON", "points": -200, "timestamp": "2020-10-31T15:00:00Z" },
        { "payer": "MILLER COORS", "points": 10000, "timestamp": "2020-11-01T14:00:00Z" },
        { "payer": "DANNON", "points": 300, "timestamp": "2020-10-31T10:00:00Z" }
        ]
    }

The `spend` call can be called with the following input:
    { "points": 5000 }

The `points_balance` route can simply be called.

**For information of fetch routes, please refer to the routes.rb file located in the config folder**

## it has also been copy and pasted below for your convenience

Rails.application.routes.draw do
  resources :transactions, only: [:show, :index, :create]
  resources :payers, only: [:index]
  get "/spend", to: 'transactions#spend'
  get "/points_balance", to: 'transactions#points_balance'

end