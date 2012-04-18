ECommerce::Application.routes.draw do
  
  get "files/new"

  get "products/index"

  get "static_pages/home"
  
  get '/heroku_reset', to:"static_pages#heroku_db_reset"
  
  get '/heroku_migrate', to:"static_pages#heroku_db_migrate"
  
  root :to => 'static_pages#home'
  
  namespace :admin do
    root to:"base#index"
    resources :products
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
  
 
end
