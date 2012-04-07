class Admin::ProductsController < Admin::BaseController
  
  before_filter :find_product, only:[:show]
  
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
      message=t("admin.products.create.success",:title=>@product.title);
      message+=" "+view_context.link_to( t("admin.products.create.where"),'#' ) 
      message+=t("admin.products.create.or")
      message+=view_context.link_to( t("admin.products.create.another") , new_admin_product_path ) 
      flash[:block]=message.html_safe
      redirect_to [:admin,@product]                 
    else
      # no flash message, errors is self explanatory.
      render :new
    end  
  end 
  
  
  def show
    @title=t("admin.products.show.title",title:@product.title)     
  end
  
  private
  
  def find_product
    @product = Product.find(params[:id])
    rescue
      flash[:block]=t("admin.products.unavailable_product") 
      redirect_to admin_products_path 
  end

end
