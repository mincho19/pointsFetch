Rails.application.routes.draw do
  resources :transactions, only: [:show, :index, :create]
  resources :payers, only: [:show]

  get 'spend', to: 'transactions#spend'


end
