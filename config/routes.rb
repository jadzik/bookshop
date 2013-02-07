Bookshop::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :clients
  resources :clients, :only => [:new, :create, :show, :edit]
  resources :addresses, :except => [:show]
  resources :payers
  resources :orders
  resources :order_items

  resources :products do
    resources :order_items do
      resources :orders do
        member do 
          get :add_to_cart
        end
      end
    end
  end
 

  root :to => 'home#index'
    match '/about_company', :to => 'home#about_company'
    match '/contact_us', :to => 'home#contact_us'
    match '/rules', :to => 'home#rules'
#  match "/contact_us", :to => "contacts#new"
  
  resources :contacts, :only => [:new, :create]
  resources :books, :only => [:index, :show]
  resources :games, :only => [:index, :show]
  resources :accessories, :only => [:index, :show]
  resources :category_books, :only => [:index, :show]
  resources :subcategory_books, :only => [:show]
  resources :category_games, :only => [:index, :show]
  resources :subcategory_games, :only => [:show]
  resources :category_accessories, :only => [:index, :show]
  resources :publisher_books, :only => [:index, :show]
  resources :publisher_games, :only => [:index, :show]
  resources :new_products, :only => [ :index]

end
