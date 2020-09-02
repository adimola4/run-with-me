Rails.application.routes.draw do
  
  root 'trainings#index'
  

  devise_for :users

  resources :users, only: [:index, :show] 

  resources :trainings do 
    resources :partners, only: [:create, :destroy]
    get 'search', on: :collection
  end

  get '/about', to: 'about#index', as: 'about'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
