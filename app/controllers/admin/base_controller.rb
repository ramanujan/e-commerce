class Admin::BaseController < ApplicationController
   
   def index
      @title=t("admin.base.index.title")
    end 
     
end