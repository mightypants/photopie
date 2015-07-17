class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :user, null: false
      t.integer :cover, null: false, default: 0 # 0 indicates a random photo will be used
      t.string :visibility, default: "private" # public, or shared
      t.timestamps null: false
    end
    add_index(:albums, :user_id)
  end
end
