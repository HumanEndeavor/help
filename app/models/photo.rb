class Photo < ActiveRecord::Base
  has_many :people
  has_many :sponsors
end
