# frozen_string_literal: true

Rails.application.routes.draw do
  resources :static_pages, only: %i[index create]
  root to: 'static_pages#index'
end
