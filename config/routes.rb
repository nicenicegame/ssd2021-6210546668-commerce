Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins

  root 'home#index'
  match '/products/:product_id' => 'home#show', via: :get

  match '/admins/products/:product_id/delete_image/:id' => 'admins/products#delete_image', via: :get

  resources :orders

  namespace :admins do
    namespace :products do
      post 'csv_upload'
    end
  end

  namespace :admins do
    resources :products
    resources :categories
    resources :orders
  end
  
end
