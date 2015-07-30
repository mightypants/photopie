class CreateAlbumPhotos < ActiveRecord::Migration
  def change
    create_table :album_photos do |t|
      t.references :album
      t.references :photo
      t.boolean :hidden, default: false
      t.timestamps null: false
    end
    add_index :album_photos, [:album_id, :photo_id]
  end
end
