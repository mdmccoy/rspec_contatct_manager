Rails.application.routes.draw do
  get 'sessions/create'

  resources :companies
  resources :email_addresses, except: [:index,:show]
  resources :people
  resources :phone_numbers, except: [:index,:show]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => redirect('/auth/twitter')
  delete '/logout' => 'sessions#destroy'

  resources :sessions, :only => [:create]
  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
