class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.boolean :image_of_people
      t.integer :people_id
      t.integer :sponsor_id
      t.binary :image_type

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
