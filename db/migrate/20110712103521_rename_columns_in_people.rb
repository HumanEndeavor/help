class RenameColumnsInPeople < ActiveRecord::Migration
  def self.up
    add_column(:people, :first_name, :string)
    add_column(:people, :last_name, :string)
    remove_column(:people, :name)

  end

  def self.down
    remove_column(:people, :first_name)
    remove_column(:people, :last_name)
    add_column(:people, :name, :string)
  end
end
