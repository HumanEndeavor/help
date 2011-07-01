class Person < ActiveRecord::Base
  belongs_to :state, :photo, :district
  def auto_complete_info(field)
    { "id" => id, "label" => send(field), "value" => send(field) }
  end
end
