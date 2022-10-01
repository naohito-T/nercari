# frozen_string_literal: true

Rails.application.routes.draw do
  # app/controlllers/usersにmapping
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/password',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks'
  }
  
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
end
