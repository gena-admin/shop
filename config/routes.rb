Rails.application.routes.draw do
  resources :products do
    collection do
      get :import_products
      post :process_import
    end

    put :add_to_cart, on: :member
  end

  devise_for :users
  root to: 'dashboard#index'

  resources :dashboard, only: [:index] do
    collection do
      get :customers
      get :orders
    end
  end

  resources :carts, only: [:index] do
    collection do
      put '/add_item/:product_id', to: 'carts#add_item', as: 'add_item'
      put '/remove_item/:product_id', to: 'carts#remove_item', as: 'remove_item'
      put '/remove_product/:product_id', to: 'carts#remove_product', as: 'remove_product'
      post :make_order
    end
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :products, only: [:index, :show, :create] do
        put :update_price
      end
    end
  end
end
