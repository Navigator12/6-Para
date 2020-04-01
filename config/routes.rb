# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#show'
  resources :users do
    resources :posts
  end

  resources :relationships, only: [:create, :destroy]

end
