Rails.application.routes.draw do
  resources :transactions, only: [:show, :index]
  resources :payers, only: [:index]

  get "/spend/:points", to: 'transactions#spend'
  get "/points_balance", to: 'transactions#points_balance'
  get "/transactions/:payer/:points/:timestamp", to: "transactions#create"
end
