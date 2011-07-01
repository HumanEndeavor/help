class CreateNgos < ActiveRecord::Migration
  def self.up
    create_table :ngos do |t|
      t.string :name
      t.integer :category_id
      t.integer :state_id
      t.integer :district_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ngos
  end
end
