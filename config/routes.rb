Rails.application.routes.draw do

  get 'tagged' => 'artworks#index', :as => 'tagged'
  get 'series' => 'artworks#index', :as => 'series'
  get 'sold' => 'artworks#sold', :as => 'sold'
  get 'unsold' => 'artworks#unsold', :as => 'unsold'
  get 'landscape' => 'artworks#landscape', :as => 'landscape'
  get 'stilllife' => 'artworks#stilllife', :as => 'stilllife'
  get 'figure' => 'artworks#figure', :as => 'figure'
  get 'interior' => 'artworks#interior', :as => 'interior'
  get 'oil' => 'artworks#oil', :as => 'oil'
  get 'watercolor' => 'artworks#watercolor', :as => 'watercolor'
  get 'inkwash' => 'artworks#inkwash', :as => 'inkwash'
  get 'charcoal' => 'artworks#charcoal', :as => 'charcoal'
  get 'graphite' => 'artworks#graphite', :as => 'graphite'

  devise_for :users, :skip => :registrations

  root "artworks#index"
  get "about" => "pages#about"
  get "admin" => "artworks#admin"

  match '/contacts', to: 'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create]

  resources :artworks, path: ''

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"
 

  # following http://stackoverflow.com/questions/15329041/browser-based-new-user-approval-by-admin-in-rails-3-2-app-using-devise
  #match 'users/:id/approve'=> 'users#approve_user', as: 'approve_user'

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
