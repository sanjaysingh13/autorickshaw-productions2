Rails.application.routes.draw do
  resources :stills
  resources :sessions
  #map.connect 'login', :controlller => 'sessions', :action => 'create'
  #map.connect 'logout', :controlller => 'sessions', :action => 'destroy'
  match "/login", :to => "sessions#new", :via => :get
  match "/logout", :to => "sessions#destroy", :via => :get

  match "films/addfilm", :to => "films#addfilm", :via => :get
  match "films/feature", :to => "films#feature", :via => :get
  resources :films
  resources :stills
  #post 'contact', to: 'contacts#process_form'
  resources :contacts, only: [:new, :create]


  root to: 'films#feature'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
