class Person < ActiveRecord::Base
  belongs_to :state 
  belongs_to :photo
  belongs_to :district

  has_attached_file :photo

  def auto_complete_info(field)
    { "id" => id, "label" => send(field), "value" => send(field) }
  end
end
