class CreateCategoriesNgos < ActiveRecord::Migration
  def self.up
    create_table :categories_ngos, :id=> false do |t|
      t.integer :category_id
      t.integer :ngo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_ngos
  end
end
