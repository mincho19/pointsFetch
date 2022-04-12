Rails.application.routes.draw do
  resources :transactions, only: [:show, :index, :create]
  resources :payers, only: [:index]
  get "/spend", to: 'transactions#spend'
  get "/points_balance", to: 'transactions#points_balance'

end
