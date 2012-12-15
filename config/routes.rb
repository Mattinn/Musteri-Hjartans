Musteri::Application.routes.draw do
    
  #The root is on top since its the most visited route (will be found quicker)  
  root :to => 'news#index'
  
  #Resources for various services on the site   registrations#update
  resources :news do
    collection do
      get 'all'
    end
  end
  
  resources :sayings
  
  resources :webstores

  resources :books
  
  resources :contacts

  resources :abouts
  
  #Resources for users
  authenticated :user do
    root :to => 'members#welcome'
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }


  resources :members, :except => [:create, :edit] do
    get 'welcome'
  end

  
  #Resources for treatments
  resources :categories

  resources :treatments
  
  #Resources for the personal tests
  resources :personal_tests
  
  resources :questions
  
  resources :results
  
  resources :answered_questions
  
  resources :user_personal_test_sessions
  

  #Custum routes
  match "users/:id/activate" => "members#activate", :as => "activate_user" #usage: activate_user_path(user)
  match "users/:id/deactivate" => "members#deactivate", :as => "deactivate_user" #usage: deactivate_user_path(user)


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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
