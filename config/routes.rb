Su21::Application.routes.draw do
  devise_for :users, :skip => :registrations
  root 'static_pages#home'

  namespace :admin do
    match '/', to: 'dashboard#dashboard', via: 'get'
    resources :lessons
    resources :posts
    resources :settings, only:[:index, :edit, :update]
    match '/settings/vk/sign_up',  to: 'vk_sessions#new', via: 'get'
    match '/settings/vk/callback', to: 'vk_sessions#callback', via: 'get'
    match '/settings/vk/destroy',  to: 'vk_sessions#destroy', via: 'delete'
  end

  match 'day',  to: 'lessons#day',  via: 'get'
  match 'week', to: 'lessons#week', via: 'get'
  match 'vk_posts', to: 'posts#vk_posts', via: 'get', constraints: { format: /(js|json|mobile)/ }

  resources :posts, only:[:index, :show]
  match 'posts_preview', to: 'posts#posts_preview', via: 'get', constraints: { format: /(js|json)/ }

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
