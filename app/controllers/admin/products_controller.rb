class Admin::ProductsController < Admin::BaseController
  
  include(::Admin::ProductsHelper)
  
  before_filter :find_product, only:[:show,:edit,:update]
  
  def index
    @title=t("admin.products.index.title")  
    @products = Product.all
  end
  
  
  def new 
    @title=t("admin.products.new.title")     
    @product = Product.new    
  end 
  
# La form relativa ad un nuovo prodotto è una form complessa. Oltre ai dati del prodotto arrivano i dati 
# relativi alle immagini caricate: 
# params[:product][:asset_attributes]=>{0=>{...},
#                                       1=>{...},
#                                       .
#                                       .
#                                       }  

# Si evince l'Hash: params=>{ :product =>{:title=>"",
#                                         :description=>""}
#                                         :asset_attributes=>{...}
#                                         }
  
  def create
    
    @product = Product.new params[:product]
    
    if @product.save
      create_product_flash_message('create_success','block') # Vedi products_helpers
      redirect_to [:admin,@product]                 
    else
      # no flash message, errors is self explanatory.
      render :new
    end  
  end 
  
  
  def edit
    @title=t("admin.products.edit.title",:title=>@product.title)      
  end
  
  def update
    begin
      if @product.update_attributes(params[:product]) 
        create_product_flash_message('update_success','block') # Vedi products_helpers
        redirect_to [:admin,@product]
      else
        render :edit # Niente flash, stampo solo gli errori. 
      end
    
    rescue => msg
      flash[:error]=t("admin.products.update.error",msg:msg)
      redirect_to  [:admin,@product]
    end
    
  end
  
  def show
    @title=t("admin.products.show.title",title:@product.title)     
  end
  
  
  def destroy
    @product=Product.destroy(params[:id])
    create_product_flash_message('delete_success','block') # Vedi products_helpers 
    redirect_to admin_products_path 
  end
  
  private
  
  def find_product
    @product = Product.find(params[:id])
    rescue
      flash[:block]=t("admin.products.unavailable_product") 
      redirect_to admin_products_path 
  end

end
