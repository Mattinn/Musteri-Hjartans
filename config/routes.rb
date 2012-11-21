  Musteri::Application.routes.draw do
  
  resources :webstores


  resources :books


  root :to => 'news#index'
   
  resources :contacts

  resources :abouts

  resources :results

  resources :user_personal_test_sessions

  resources :questions

  resources :personal_tests

  resources :categories

  resources :treatments

  resources :books

  devise_for :users #, :controllers => { :registrations => "registrations" } 


  resources :news do
    collection do
      get 'all'
    end
  end
  
  resources :users do
    collection do
      get 'welcome'
    end
  end
  
  #Custum routes
  #match "news/all" => "news#all", :as => "news_all"
  match "users/:id/activate" => "users#activate", :as => "active_user" #usage: activate_user_path(user)
  
  #match "personal_tests/:id/calculate_result" => "personal_tests#calculate_result", :as => "calculate_result"
  
  #match "users/new" => "devise#sign_up", :as => "sign_up"



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
