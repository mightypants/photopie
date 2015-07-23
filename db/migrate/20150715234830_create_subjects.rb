class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :firstname, null: false
      t.string :middlename
      t.string :lastname
      t.date :birth_date, null: false
      t.integer :user_id, null: false
      t.integer :pie_album
      t.timestamps null: false
    end
    add_index(:subjects, :user_id)
    add_index(:subjects, :pie_album)
  end
end
