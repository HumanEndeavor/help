class CreateTableSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.binary :image
    end
  end

  def self.down
    drop_table :slides
  end
end
