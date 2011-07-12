class District < ActiveRecord::Base
  belongs_to :state
  has_many :people
  has_many :sponsors

  scope :for_state, lambda {|state| state ? where("state_id = ? ",state) : all }
end
