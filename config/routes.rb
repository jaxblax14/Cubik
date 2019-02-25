Rails.application.routes.draw do
  devise_for :users
  get 'challenge/index'
  get 'dashboard/index'
  get 'homepage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  #Mantenedor de unidades
  get 'units/index'
  get 'units/new'
  get 'units/edit/:unit_id' => 'units#edit', as: 'units_edit'
  post 'units/create'
  post 'units/update/:unit_id' => 'units#update', as: 'units_update'

  # Mantenedor de desafíos
  get 'challenge/new'
  get 'challenge/index'
  get 'challenge/edit/:challenge_id' => 'challenge#edit', as: 'challenge_edit'
  post 'challenge/create'
  post 'challenge/update/:challenge_id' => 'challenge#update', as: 'challenge_update'
end
