Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :categories
      resources :rates
      resources :addresses
      resources :users
      resources :sales
      resources :products do
        collection do
          get 'filter_by_category/:category_id', to: 'products#filter_by_category'
        end
      end
      resources :user_rate_products
      resources :sale_products
    end 
  end
end

