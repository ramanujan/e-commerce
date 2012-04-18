class AddQtyToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qty, :integer,:default=>0

  end
end
