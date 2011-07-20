class CreateNgosStates < ActiveRecord::Migration
  def self.up
    create_table :ngos_states, :id=> false do |t|
      t.integer :state_id
      t.integer :ngo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ngos_states
  end
end
