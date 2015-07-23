class AddAdminAndPasswordDigestToUsers < ActiveRecord::Migration
  def up
    remove_column "users", "password"
    add_column "users", "password_digest", :string
    add_column "users", "is_admin", :boolean
  end

  def down
    add_column "users", "password", :string, :limit => 40
    remove_column "users", "password_digest"
    remove_column "users", "is_admin", :boolean
  end
end
