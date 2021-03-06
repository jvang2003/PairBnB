Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'residences/search' => 'residences#search'

  get '/month_schedules/:user_id/:month/:year' => 'month_schedules#show'

  post 'messages/reply' => 'messages#reply'

  resources :sessions, only:[:new, :create, :destroy]
  resources :users, except: [:index] do
    resources :messages, only: [:new, :create, :destroy]
    resources :availabilities, only: [:create, :destroy]
    resources :requests, only: [:show, :index]
  end

  resources :residences do
    resources :images, only:[:new, :create, :destroy]
    resources :requests, only: [:create, :destroy]
  end

  resources :pairings, only: [:create] do
    resources :shoutouts, only: [:new, :create, :destroy]
  end

  # You can have the root of your site routed with "root"
  root 'landings#show'

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
