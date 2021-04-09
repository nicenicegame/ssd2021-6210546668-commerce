Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins

  root 'admins/products#index'

  namespace :products do
    post 'csv_upload'
  end

  namespace :admins do
    resources :products
  end
  
  resources :categories
end
