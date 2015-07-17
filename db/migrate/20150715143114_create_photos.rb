class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filepath, null: false
      t.string :filetype, default: "image" #image or movie file
      t.references :user, null: false
      t.date :meta_timestamp #timestamp from the image file's meta data
      t.date :user_timestamp #user entered timestamp (overrides meta if present)	
      t.integer :width
      t.integer :height
      t.text :caption
      t.text :tags
      t.timestamps null: false
    end
    add_index(:photos, :user_id)
  end
end
