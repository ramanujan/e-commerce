class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.has_attached_file :image
      t.timestamps
      t.references :product
    end
  end
end

=begin
 
 Ricordiamo che una volta installato paperclicp, ActiveRecord::Migration e ActiveRecord::Base verranno
 popolati con dei nuovi metodi relativi a paperclip. In particolare si vede che qui sopra possiamo 
 utilizzare t.has_attached_file :asset che genera le seguenti colonne:
 
 1) image_file_name
 2) image_content_type
 3) image_file_size
 4) image_updated_at

 
 
=end