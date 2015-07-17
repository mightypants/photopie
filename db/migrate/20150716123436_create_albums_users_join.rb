class CreateAlbumsUsersJoin < ActiveRecord::Migration
  def change
    create_table :albums_users, :id => false do |t|
      t.integer :album_id
      t.integer :user_id
      t.integer :permissions, default: 0 # 0 for view, 1 for edit
    end
      add_index :albums_users, [:album_id, :user_id]
  end
end
