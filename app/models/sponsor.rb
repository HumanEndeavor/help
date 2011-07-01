class Sponsor < ActiveRecord::Base
  belongs_to :state, :photo, :district
end
