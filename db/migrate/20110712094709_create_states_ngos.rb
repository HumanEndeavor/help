class CreateStatesNgos < ActiveRecord::Migration
  def self.up
    create_table :states_ngos do |t|
      t.integer :state_id
      t.integer :ngo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :states_ngos
  end
end
