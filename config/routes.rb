Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins

  root 'admins/products#index'

  match '/admins/products/delete_primary_image/:id' => 'admins/products#delete_primary_image', via: :get
  match '/admins/products/delete_supporting_images/:id' => 'admins/products#delete_supporting_images', via: :get

  namespace :admins do
    namespace :products do
      post 'csv_upload'
      # match 'delete_supporting_images/:id' => 'admins/products#delete_supporting_images', via: :get
    end
  end

  namespace :admins do
    resources :products
    resources :categories
  end
  
end
