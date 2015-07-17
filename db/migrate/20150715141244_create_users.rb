class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 20
      t.string :password, null: false
      t.string :email, null: false, limit: 40
      t.string :firstname, limit: 20
      t.string :lastname, limit: 40	
      t.timestamps null: false
    end
  end
end
