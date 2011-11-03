Hussy::Application.routes.draw do

  resources :referrals

  resources :results

  resources :therapies

  devise_for :users
  post "/users/sign_in"    => "sessions#create"
  delete "/users/sign_out" => "devise/sessions#destroy"
  
  #devise_scope :user do
 	 # get "sign_up" => "users/registrations#new"
 	 #get "users/sign_out" => "devise/sessions#destroy"
  #end
  
  match "/users" => "users#index", :as => :index
  
  resources :users
  
 # match "/users/show(.:format)" => "users#show", :as => :user
  
  #namespace :users do
  #	  resources :registrations 
  #end
  #map.new_user_registration '/users/registrations/new', :controller => 'users/registrations', :action => 'new', :conditions => {:method => :get}
  #map.create_user_registration '/users/registrations/create', :controller => 'users/registrations', :action => 'create', :conditions => {:method => :post}
  #map.user_account 'account', :controller => 'users', :action => 'account'


  resources :ethnicities

  resources :patients

  resources :consultations

  resources :classifications

  resources :characteristics

  resources :hospitals

  resources :medics

  resources :outcomes

  resources :drugs
  
  resources :roles
  
  resources :pages
  
  resources :properties
  
  resources :assays
  
  resources :treatments
  
  match 'admin', :controller => 'pages', :action => 'admin_section'
  match 'search_form', :controller => 'patients', :action => 'search_form'
  match 'search', :controller => 'patients', :action=> 'search'
  
  root :to => "pages#show", :controller => :page, :action => :show, :name => "welcome"


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
