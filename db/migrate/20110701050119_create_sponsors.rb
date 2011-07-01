class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.integer :name
      t.string :emailid
      t.integer :state_id
      t.integer :people, :district_id, :integer
      t.integer :age
      t.string :qualification
      t.string :job_status
      t.string :sex
      t.string :address
      t.integer :contact_number
      t.boolean :rural
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
