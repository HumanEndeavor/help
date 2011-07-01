class AddUserIdToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :user_id, :integer
  end

  def self.down
    remove_column :roles, :user_id
  end
end
