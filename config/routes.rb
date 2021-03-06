Gtask1::Application.routes.draw do
  get '/',to:"home#index"
  devise_for :users, controllers:{omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :users do
    root :to => 'devise/registrations#new'
  end
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # get ':controller(/:action(/:id(.:format)))'
  # post ':controller(/:action(/:id(.:format)))'
  # root :to => 'home#index'
  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
  get '/index' , to: 'home#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  get ':controller(/:action(/:id(.:format)))'
    resources :home do
      # collection do
        get 'barchart'
        get 'multilinechart'
        get 'piechart'
        get 'test2'
        # get 'index'
      # end
    end

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
