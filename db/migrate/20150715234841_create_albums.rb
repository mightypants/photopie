class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :cover, null: false, default: 0 # 0 indicates a random photo will be used
      t.integer :visibility, default: 0 # 0 for private, 1 for shared, 2 for public
      t.timestamps null: false
    end
  end
end
