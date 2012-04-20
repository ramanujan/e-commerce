class Admin::ProductsController < Admin::BaseController
  
  include(::Admin::ProductsHelper)
  
  before_filter :find_product, only:[:show,:edit,:update,:inventory]
  
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
  
=begin
   
   In questo metodo si è scelto di utilizzare ActiveRecord::Persistence#update_attributes()
   e non  ActiveRecord::Persistence#update_attribute() poichè quest'ultimo :
   
   
   1) SALTA le validazioni
   2) INVOCA Callbacks
   3) AGGIORNA updated_at/updated_on 
   4) AGGIORNA tutti gli altri attributi che sono dirty nell'oggetto !
   
   Invece update_attributes aggiorna gli attributi specificati nell'hash, e invoca save(). 
   Questo mi serve perchè desidero avero la possibilità di validare il campo quantity, e 
   precisamente desidero che sia comunque un numero. 
   
   Questo apre tutta una discussione sulla trattazione della risposta AJAX nel caso di 
   failure oppure nel casa sia andato tutto bene, e l'aggiornamento abbia avuto luogo!
   
   Si infatti voglio che questa sia un'azione AJAX.  In particolare genero sempre un flash message
   sia che l'aggiornamento abbia avuto luogo senza problemi, sia che si siano verificati problemi.
   Poi nella presentazione mando al client un frammento HTML contenente la presentazione dei messaggi, che 
   però verranno visualizzati in un'altro modo! Ad esempio una piccola notifica a fianco, posizionata
   in maniera assoluta, con l'effetto della sovrapposizione ? 
   
=end
  
  def inventory
   begin
     if @product.update_attributes( :qty=>params[:quantity] )  
       create_product_flash_message('update_quantity_success','block') # Vedi products_helpers
     else
       create_product_flash_message('update_quantity_invalid','block') # Vedi products_helpers
     end    
   
   rescue => msg
     flash[:error]=t("admin.products.update.error",msg:msg)
   end
   
   render :partial=>'update_qty_result', :content_type=>'text/html'
  end
  
  def search
    
    @title=t("admin.products.search.title")  
    @products = Product.search(params[:search_product])
    (params[:format]=='ajax') ? render(:partial=>'search',content_type:"text/html") : render(:index) 
    
    
  end
  
  
  private
  
  def find_product
    @product = Product.find(params[:id])
    rescue
      flash[:block]=t("admin.products.unavailable_product") 
      redirect_to admin_products_path 
  end

end
