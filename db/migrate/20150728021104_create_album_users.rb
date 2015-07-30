class CreateAlbumUsers < ActiveRecord::Migration
  def change
    create_table :album_users do |t|
      t.integer :album_id
      t.integer :user_id
      t.integer :access_type, default: 0 # 0 for view, 1 for edit, 2 for owner
      t.timestamps null: false
    end
      add_index :album_users, [:album_id, :user_id]
  end
end
