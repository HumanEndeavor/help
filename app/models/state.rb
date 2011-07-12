class State < ActiveRecord::Base
  has_many :districts
  has_many :sponsors
  has_many :people
  has_and_belongs_to_many :ngos
  scope :for_ngo, lambda {|ngo| ngo ? where("ngo_id = ? ", ngo) : all }
end
