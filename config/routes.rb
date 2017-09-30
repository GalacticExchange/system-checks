Rails.application.routes.draw do
  #devise_for :users

  # optimacms devise
  devise_for :cms_admin_users, Optimacms::Devise.config

  match 'debug/:action', to: 'debug#action', via: [:get, :post], as: 'debug'

  match 'demo/:action', to: 'demo#action', via: [:get, :post], as: 'demo'
  match 'demo4/:action', to: 'demo4#action', via: [:get, :post], as: 'demo4'



  #
  get 'servers', to: 'servers#index', as: :servers

  get 'check-select', to: 'checks#select', as: :select_checks
  #get 'checksets', to: 'checksets#index', as: :checksets
  resources :checksets

  get 'checks', to: 'checks#index', as: :checks
  match 'checks/set', to: 'checks#set', as: :set_checks, via: [:get, :post]
  put 'checks', to: 'checks#update_check_server', as: :update_check_server
  get 'check/get_info', to: 'checks#get_info', as: :get_info_check



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

  #

  scope '/admin' do
    scope module: 'admin', as: 'admin' do

      resources :servers do
        collection do
          post 'search'
        end
      end

      resources :checksets do
        collection do
          post 'search'
        end
      end

      get '/runner/select', to: 'runner#index'
      get '/runner/', to: 'runner#run'
      put '/runner/update_check_server', to: 'runner#update_check_server'
      get '/runner/get_info', to: 'runner#get_info'
      match '/runner/set', to: 'runner#set', as: :set_checks, via: [:get, :post]

    end
  end

  # !!! LAST row
  mount Optimacms::Engine => "/", :as => "cms"

  # for names
  root to: "home#index"


end
