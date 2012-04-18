class FilesController < ApplicationController
  
  def new
    @product = Product.new 
    @product.assets.build
 
    number=params[:number].to_i unless params[:number].nil?
    render :partial=>'files/form', :locals=>{:number=>number}
    
  end
end
