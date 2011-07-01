class Photo < ActiveRecord::Base
  has_many :people, :sponsors
end
