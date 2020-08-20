Rails.application.routes.draw do
  devise_for :customers, controllers: {
  	sessions:      'public/sessions',
    registrations: 'public/registrations'
  }

  devise_for :admins, controllers: {
  	sessions:      'admin/sessions',
  }

  root "homes#top"
  get "/about" => "homes#about"

  delete "public/cart_items/all_destroy" => "public/cart_items#all_destroy"
  get "public/orders/confirm" => "public/orders#confirm"
  post "public/orders/confirm" => "public/orders#confirm"
  get "public/orders/thanks" => "public/orders#thanks"
  get "public/customers/withdraw" => "public/customers#withdraw"
  patch "public/customers/withdraw" => "public/customers#withdraw_update"


  get "admin/" => "admin/homes#top"

  resources :products, only: [:index, :show]

  namespace :public do
  	resources :cart_items, only: [:index, :update, :destroy, :create]
  	resources :orders, only: [:index, :show, :new, :create]
  	resources :customers, only: [:show, :edit, :update]
  	resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end



  namespace :admin do
  	resources :orders, only: [:index, :update, :show]
  	resources :customers, only: [:index, :show, :edit, :update]
  	resources :genres, only: [:index, :new, :create, :edit, :update]
  	resources :products, only: [:index, :new, :create, :show, :edit, :update]
  	resources :ordering_products, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
