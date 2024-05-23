# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
      resources :books, only: [:index, :create, :update, :show, :destroy]
      resources :ratings, only: [:index, :create, :update, :show, :destroy]
    end
end
