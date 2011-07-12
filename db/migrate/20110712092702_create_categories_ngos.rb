class CreateCategoriesNgos < ActiveRecord::Migration
  def self.up
    create_table :categories_ngos do |t|
      t.integer :category_id
      t.integer :ngo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :categoris_ngos
  end
end
