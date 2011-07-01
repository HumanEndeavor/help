class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
