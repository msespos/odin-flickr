Rails.application.routes.draw do
  resources :static_pages, only: [:index, :create]
  root to: 'static_pages#index'
end
