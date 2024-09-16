Rails.application.routes.draw do
  devise_for :drivers
  devise_for :staff
  # get 'messages/index'
  root 'home#index'

  # get 'home/index'
  resources :messages
  resources :staff_messages
  resources :notices do
    member do
      post :expire
    end
  end
  # post '/notices/:id/expire', to: 'notices#expire'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
