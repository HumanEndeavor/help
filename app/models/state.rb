class State < ActiveRecord::Base
  has_many :districts
  has_many :sponsors
  has_many :people
end
