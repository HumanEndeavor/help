class RenameJoinTablesAlphabetically < ActiveRecord::Migration
  def self.up
    drop_table :people_ngos
    create_table :ngos_people do |t|
      t.integer :person_id
      t.integer :ngo_id
      t.timestamps
    end
  end

    def self.down
      create_table :people_ngos do |t|
      t.integer :person_id
      t.integer :ngo_id
      t.timestamps
      end
      drop_table :ngos_people
    end
  end
