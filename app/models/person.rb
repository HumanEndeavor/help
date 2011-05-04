class Person < ActiveRecord::Base
  def auto_complete_info(field)
    { "id" => id, "label" => send(field), "value" => send(field) }
  end
end
