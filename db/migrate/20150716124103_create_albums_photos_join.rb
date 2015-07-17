class CreateAlbumsPhotosJoin < ActiveRecord::Migration
  def change
    create_table :albums_photos, :id => false do |t|
      t.integer :album_id
      t.integer :photo_id
      t.boolean :hidden
    end
    add_index :albums_photos, [:album_id, :photo_id]
  end
end
