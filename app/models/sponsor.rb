class Sponsor < ActiveRecord::Base
  belongs_to :state
  belongs_to :photo
  belongs_to :district
end
