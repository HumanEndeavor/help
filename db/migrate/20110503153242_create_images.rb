class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|

      t.string   :ATTACHMENT_file_name
      t.string   :ATTACHMENT_content_type
      t.integer  :ATTACHMENT_file_size
      t.datetime :ATTACHMENT_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
