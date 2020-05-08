# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#show'
  resources :users do
    resources :posts
  end

  get 'users/:id/followers' => 'users#followers'
  get 'users/:id/following' => 'users#following'

  resources :relationships, only: %i[create destroy]
  resources :streams, only: :index

  resources :conversations do
    resources :messages
  end
end
