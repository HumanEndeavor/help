class AddDetailsToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :emailid, :string
    add_column :people, :state_id, :integer
    add_column :people, :district_id, :integer
    add_column :people, :age, :integer
    add_column :people, :qualification, :string
    add_column :people, :job_status, :string
    add_column :people, :sex, :string
    add_column :people, :address, :string
    add_column :people, :contact_number, :integer
    add_column :people, :rural, :boolean
    add_column :people, :photo_id, :integer
  end

  def self.down
    remove_column :people, :photo_id
    remove_column :people, :rural
    remove_column :people, :contact_number
    remove_column :people, :address
    remove_column :people, :sex
    remove_column :people, :job_status
    remove_column :people, :qualification
    remove_column :people, :age
    remove_column :people, :state_id
    remove_column :people, :email_id
  end
end
