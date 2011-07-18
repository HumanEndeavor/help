class CreatePeopleNgos < ActiveRecord::Migration
  def self.up
    create_table :people_ngos do |t|
      t.integer :person_id
      t.integer :ngo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :people_ngos
  end
end
