Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :categories
      resources :rates
      resources :addresses
      resources :users
      resources :sales
      resources :products
      resources :user_rate_products
    end 
  end
end
