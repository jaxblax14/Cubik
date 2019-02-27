Rails.application.routes.draw do
  get 'challenge_intro/intro//:challenge_id' => 'challenge_intro#intro' , as: 'challenge_intro_intro'
  namespace :challenge do
    get ':challenge_id/units/assign'=> 'units#assign', as: 'units_assign'
    get ':challenge_id/units/edit/(:challenge_has_unit_id)'=> 'units#edit', as: 'units_edit'
    post ':challenge_id/units/save_assign' => 'units#save_assign', as: 'units_save_assign'
    post ':challenge_id/units/update/(:challenge_has_unit_id)' => 'units#update', as: 'units_update'
  end
  devise_for :users
  # se muestran todos los challenges creados
  get 'challenge/index'
  #dashboard usuarios.
  get 'dashboard/index'
  #homepage
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
