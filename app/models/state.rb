class State < ActiveRecord::Base
  has_many :districts, :sponsors, :people
end
