class AddPaperClipToPhoto < ActiveRecord::Migration
  def change
  	add_attachment :photos, :image 
  	remove_column :photos, :filepath
  end
end
