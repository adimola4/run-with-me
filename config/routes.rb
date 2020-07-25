Rails.application.routes.draw do
  
  root 'trainings#index'

  devise_for :users

  resources :trainings


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end