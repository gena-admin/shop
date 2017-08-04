Rails.application.routes.draw do
  resources :products do
    get :import_products, on: :collection
    post :process_import, on: :collection
  end

  devise_for :users
  root to: 'dashboard#index'
end
