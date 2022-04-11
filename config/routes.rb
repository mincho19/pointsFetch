Rails.application.routes.draw do
  resources :transactions, only: [:show, :index, :create]
  resources :payers, only: [:show, :index]

  get "spend/:spend", to: 'transactions#spend'


end
