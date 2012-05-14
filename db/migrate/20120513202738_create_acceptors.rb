class CreateAcceptors < ActiveRecord::Migration
  def change
    create_table :acceptors do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.integer :zipcode
      t.integer :state_id
      t.string :region
      t.integer :category_id

      t.timestamps
    end
  end
end
