class District < ActiveRecord::Base
  belongs_to :state
  has_many :people, :sponsors
end
