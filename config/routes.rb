Rails.application.routes.draw do
  devise_for :users
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
end
