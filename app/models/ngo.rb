class Ngo < ActiveRecord::Base
  has_and_belongs_to_many :category
  has_and_belongs_to_many :states

  acts_as_gmappable

  def gmaps4rails_address
        address
    end

end

