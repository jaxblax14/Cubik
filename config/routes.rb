Rails.application.routes.draw do
  get 'wizzar_blockly/tutorial'
  get 'show_units/unit_1/:project_id' => 'show_units#unit_1' , as: 'show_units_unit_1'
  get 'show_units/unit_2/:project_id' => 'show_units#unit_2' , as: 'show_units_unit_2'
  get 'show_units/unit_3/:project_id' => 'show_units#unit_3' , as: 'show_units_unit_3'
  get 'show_units/ending/:project_id' => 'show_units#ending' , as: 'show_units_ending'
  get 'show_units/new_project/:challenge_id' => 'show_units#new_project' , as: 'show_units_new_project'
  get 'show_units/finalizar_desafio/:project_id' => 'show_units#finalizar_desafio', as: 'show_units_finalizar_desafio'
  get 'show_units/pasar_2/:project_id' => 'show_units#pasar_2', as: 'show_units_pasar_2'
  get 'show_units/pasar_3/:project_id' => 'show_units#pasar_3', as: 'show_units_pasar_3'    
  get 'challenge_intro/intro/:challenge_id' => 'challenge_intro#intro' , as: 'challenge_intro_intro'
  post 'challenge_intro/unit_1/:challenge_id' => 'challenge_intro#unit_1' , as: 'challenge_intro_unit_1'

  namespace :challenge do
    get ':challenge_id/units/assign'=> 'units#assign', as: 'units_assign'
    get ':challenge_id/units/edit/(:challenge_has_unit_id)'=> 'units#edit', as: 'units_edit'
    post ':challenge_id/units/save_assign' => 'units#save_assign', as: 'units_save_assign'
    post ':challenge_id/units/update/(:challenge_has_unit_id)' => 'units#update', as: 'units_update'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations"}
  #dashboard usuarios.
  get 'dashboard/index'
  #homepage
  get 'homepage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
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
