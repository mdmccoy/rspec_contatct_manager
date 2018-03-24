Rails.application.routes.draw do
  resources :email_addresses
  resources :people do
    resources :phone_numbers
  end

  resources :phone_numbers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
