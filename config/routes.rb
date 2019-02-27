Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"}
  get 'units/unit_1'
  get 'units/unit_2'
  get 'units/unit_3'
  get 'units/unit_4'
  get 'units/unit_5'
  get 'challenge/index'
  get 'dashboard/index'
  get 'homepage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  # Mantenedor de desafíos
  get 'challenge/new'
  get 'challenge/index'
  get 'challenge/edit/:challenge_id' => 'challenge#edit', as: 'challenge_edit'
  post 'challenge/create'
  post 'challenge/update/:challenge_id' => 'challenge#update', as: 'challenge_update'
end
