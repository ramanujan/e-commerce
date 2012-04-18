require 'spec_helper'

describe Admin::ProductsController do

  describe "When a product doesn't exists" do
    it "display an error message" do
      get :show,:id=>"not-here"
      response.should redirect_to(admin_products_path)
      message="The product you are looking for could be not found"
      flash[:block].should eql(message)
    end
    
    it "display an error message" do
      get :edit,:id=>"not-here"
      response.should redirect_to(admin_products_path)
      message="The product you are looking for could be not found"
      flash[:block].should eql(message)
    end
    
    it "display an error message" do
      get :update,:id=>"not-here"
      response.should redirect_to(admin_products_path)
      message="The product you are looking for could be not found"
      flash[:block].should eql(message)
    end
    
  end

end
