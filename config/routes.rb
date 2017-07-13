Rails.application.routes.draw do

  post ':doggo_name/follow_user', to: 'profiles#follow_user', as: :follow_user
  post ':doggo_name/unfollow_user', to: 'profiles#unfollow_user', as: :unfollow_user

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :howls do
    resources :barkbacks
    member do
      get 'love'
      get 'unlove'
    end
  end

  root 'howls#index'

  get ':doggo_name', to: 'profiles#show', as: :profile
  get ':doggo_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':doggo_name/edit', to: 'profiles#update', as: :update_profile
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
