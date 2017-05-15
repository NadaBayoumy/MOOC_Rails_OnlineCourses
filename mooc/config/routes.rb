Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

  # get "log_out" => "sessions#destroy", :as => "log_out"
  # get "log_in" => "sessions#new", :as => "log_in"
  # get "sign_up" => "users#new", :as => "sign_up"

  # get "log_out" => "sessions#destroy", :as => "log_out"
  # get "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  
  devise_for :users , controllers: { registrations: 'users'}



  # namespace :admin do

  #   resources :users
  # end


  # namespace :admin do
  #     # root 'admin#index'
  #     resources :lectures, except: [:show]
  #     resources :users, except: [:show]
  #     # resources :uploads, only: [:index, :show, :update, :create]
  #     resources :settings, only: [:index, :edit, :update]
  #     # mount Idioma::Engine => "/idioma"
  # end


  resources :lectures , only: [:show, :edit, :index, :new, :create] do
    member do
      put :user_like_lecture
      delete :user_dislike_lecture

      put :user_spam_lecture
      delete :user_unspam_lecture

      put :user_comment_lecture
      delete :user_remove_comment_lecture

      get :download_file
    end
  end


  resources :comments
  resources :courses
  resources :lectures
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


  # delete 'users/:id/sign_out'

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
