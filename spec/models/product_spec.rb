require 'spec_helper'

describe Product do
  
  context "with a " do
    
    it "blank title should not be valid " do
      product = Product.new title:"",description:"A foo product",price:3.34       
      product.should_not be_valid 
   
      product = Product.new title:nil,description:"A foo product",price:3.34  
      product.should_not be_valid 
     
      product = Product.new title:"    ",description:"A foo product",price:3.34  
      product.should_not be_valid 
    end
    
    it " too long title should not be valid" do
      product = Product.new title:"X"*51,description:"A foo product",price:3.34       
      product.should_not be_valid 
    end
   
   
    it "blank description should not be valid " do
   
      product = Product.new title:"A valid title",description:"",price:3.34       
      product.should_not be_valid 
   
      product = Product.new title:"A valid title",description:nil,price:3.34  
      product.should_not be_valid 
     
      product = Product.new title:"A valid title",description:"     ",price:3.34  
      product.should_not be_valid 
    end
   
    it "blank price should not be valid" do
     
      product = Product.new title:"A valid title",description:"a valid",price:""       
      product.should_not be_valid 
   
      product = Product.new title:"A valid title",description:"a valid",price:nil  
      product.should_not be_valid 
     
      product = Product.new title:"A valid title",description:"a super valid ",price:"    "  
      product.should_not be_valid 
   
    end
   
    it " price that isn't a number should not be valid" do
      product = Product.new title:"A valid title",description:"a valid",price:"Not A Number"       
      product.should_not be_valid 
    end
   
    it " price that isn't greater than 0.001 should not be valid " do
       product = Product.new title:"A valid title",description:"a valid",price:0.001       
       product.should_not be_valid 
    end
   
 end
 
end
