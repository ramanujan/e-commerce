class Product < ActiveRecord::Base
  validates :title, presence:true, length:{maximum:50}
  validates :description, presence:true
  validates :price, presence:true, numericality:{greater_than_or_equal_to:0.01} 
end
