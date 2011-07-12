class State < ActiveRecord::Base
  has_many :districts
  has_many :sponsors
  has_many :people
  belongs_to :ngo
end
