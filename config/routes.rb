Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'admins/login' => 'admins#login'
  get 'admins/logout' => 'sessions#destroy'
  get 'admins/list' => 'admins#list'
  post 'admins/update' => 'admins#admin_update'
  get 'admins/workload' => 'admins#admin_statistics_workload'
  get 'admins/jsonworkload' => 'admins#admin_workload_json'
  get 'admins/jsonlist' => 'admins#jsonlist'
  get 'admins/commodity/status_list' => 'commodity#status_list'
  get 'admins/commodity/json_status_list' => 'commodity#json_status_list'
  post 'admins/commodity/update' => 'commodity#update'
  get 'admins/businesses/status_list' => 'businesses#status_list'
  get 'admins/businesses/json_status_list' => 'businesses#json_status_list'
  get 'admins/businesses/list' => 'businesses#list'
  get 'admins/businesses/json_list' => 'businesses#json_list'
  get 'admins/businesses/statistics' => 'businesses#statistics'
  get 'admins/businesses/json_statistics' => 'businesses#json_statistics'
  get 'admins/scenics/type' =>'scenics#scenics_option'
  namespace :admins do

  end
  resources :admins
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
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
