class AddPaperClipToPhoto < ActiveRecord::Migration
  def change
  	add_attachment :photos, :image 
  	remove_column :photos, :filepath, :string
  	remove_column :photos, :filetype, :string
  end
end
