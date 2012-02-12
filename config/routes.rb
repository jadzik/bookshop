Bookshop::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :clients
  resources :clients, :only => [:new, :create, :show, :edit]
  resources :addresses, :except => [:show]
  resources :payers
  resources :orders, :except => [:destroy]
  resources :orders do
    resources :products do
      member do 
        get :add_to_cart
      end
    end
  end
 resources :orders_items

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


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
