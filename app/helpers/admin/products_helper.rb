module Admin::ProductsHelper
  def create_product_flash_message(action,type) 
    result=case action 
      when 'create_success'
        message=t("admin.products.create.success",:title=>@product.title);
        message+=" "+view_context.link_to( t("admin.products.create.where"),'#' ) 
        message+=t("admin.products.create.or")
        message+=view_context.link_to( t("admin.products.create.another") , new_admin_product_path ) 
        message
      when 'update_success'  
        message=t("admin.products.update.success",:title=>@product.title);
        message+=" "+view_context.link_to( t("admin.products.update.where"),'#' )
        message 
      when 'delete_success'
        message=t("admin.products.delete.success",title:@product.title) 
     
     end
     
     flash[type.to_s]=message.html_safe
   
   end

end
