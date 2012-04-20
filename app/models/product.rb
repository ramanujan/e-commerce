class Product < ActiveRecord::Base

  validates :title, presence:true, length:{maximum:50}
  validates :description, presence:true
  validates :price, presence:true, numericality:{greater_than_or_equal_to:0.01} 
  validates :qty, presence:true, numericality:{greater_than_or_equal_to:0}
  has_many :assets 
  accepts_nested_attributes_for :assets
  
  def self.search(query_string) 
    query_string="%#{query_string}%"
    where("title like :title or description like :description",title:query_string,description:query_string)
    .order('title desc').all
  end
   
end
