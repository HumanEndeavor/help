class AddColumnsToNgos < ActiveRecord::Migration
  def self.up
    add_column :ngos, :latitude, :float
    add_column :ngos, :longitude, :float
    add_column :ngos, :gmaps, :boolean
    add_column :ngos, :address, :string
  end

  def self.down
    remove_column :ngos, :address
    remove_column :ngos, :gmaps
    remove_column :ngos, :longitude
    remove_column :ngos, :latitude
  end
end
