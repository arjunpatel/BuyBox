BuyBox::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  devise_for :users, :controllers => { :registrations => :registrations }

  match "about" => "welcome#about", :as => :about_us
  match "ocd" => "welcome#ocd", :as => :team_ocd
  match "faq" => "welcome#faq", :as => :faq
  match "termofuse" => "welcome#termofuse", :as => :term_of_use
  match "privacypolicy" => "welcome#privacypolicy", :as => :privacy_policy
  match "contact" => "welcome#contact", :as => :contact_us

  match "/users/show" => "users#show", :as => :user_root
  match "/users/buyer_information" => "users#buyer_information", :as => :buyer_information
  match "/users/connection" => "users#connection", :as => :connection

  match "/users/profile/:id" => "users#profile", :as => :public_profile
  match "/product/" => "products#index", :as => :products
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  
  resources :users do
    resources :reviews
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index_old.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
