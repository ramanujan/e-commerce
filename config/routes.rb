ECommerce::Application.routes.draw do
  
  get "files/new"

  get "products/index"

  get "static_pages/home"
  
  get '/heroku_reset', to:"static_pages#heroku_db_reset"
  
  get '/heroku_migrate', to:"static_pages#heroku_db_migrate"
  
  # Parte riguardo esercizi AJAX 
  
  get '/static_pages/ajax_lezione_1'
  get '/static_pages/hello_stranger'
  get '/static_pages/hello_stranger_ajax'
  
  root :to => 'static_pages#home'
  
  namespace :admin do
    root to:"base#index"
    resources :products do
    
      member do
        put :inventory # Pensato per essere un'azione idempotente !
      end
      
      collection do
        get :search
      end
    
    end
  
  end
  
  
  
  
  resources :files, :only=>[:new]
  
=begin
    admin_root                /admin(.:format)                   admin/base#index
    admin_products     GET    /admin/products(.:format)          admin/products#index
                       POST   /admin/products(.:format)          admin/products#create
    new_admin_product  GET    /admin/products/new(.:format)      admin/products#new
    edit_admin_product GET    /admin/products/:id/edit(.:format) admin/products#edit
    admin_product      GET    /admin/products/:id(.:format)      admin/products#show
                       PUT    /admin/products/:id(.:format)      admin/products#update
                       DELETE /admin/products/:id(.:format)      admin/products#destroy 
=end  
  

=begin
  
  Si noti che modificare resources con :
  
  resources do
     
     member do
        put :inventory # Pensato per essere un'azione idempotente !
      end
  end 
  
  Porterà alla creazione del seguente route path : 
  
  inventory_admin_product PUT    /admin/products/:id/inventory(.:format)     admin/products#inventory
  

=end

 
end
