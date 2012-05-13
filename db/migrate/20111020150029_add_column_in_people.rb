class AddColumnInPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :photo_file_name, :string
    add_column :people, :photo_content_type, :string
    add_column :people, :photo_file_size, :integer
    add_column :people, :photo_updated_at, :datetime
    add_column :people, :gender, :string

    add_column :people, :state_id, :integer
    add_column :people, :district_id, :integer
    add_column :people, :qualification, :string
    add_column :people, :family_income, :decimal
  end

  def self.down
    remove_column :people, :photo_file_name
    remove_column :people, :photo_content_type
    remove_column :people, :photo_file_size
    remove_column :people, :photo_updated_at
    remove_column :people, :gender
#    remove_column :people, :state_id
    remove_column :people, :district_id
    remove_column :people, :qualification
    remove_column :people, :family_income
  end


end
