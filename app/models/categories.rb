class Categories < ActiveRecord::Base
  has_and_belongs_to_many :ngo
end
