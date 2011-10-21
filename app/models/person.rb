class Person < ActiveRecord::Base
  belongs_to :state 
  #belongs_to :photo
  belongs_to :district

  has_attached_file :photo#, :default_url => "/images"

  def auto_complete_info(field)
    { "id" => id, "label" => send(field), "value" => send(field) }
  end

  #attr_accessor :photo

  def self.search params
#    create conditions to find people based on selected ngo, state, district, and age
    conditions = []
    conditions << "ngo_id = #{ngo_id}" if params[:ngo_id]
    conditions << "state_id = #{state_id}" if params[:state_id]
    conditions << "district_id = #{district_id}" if params[:district_id]

    conditions.blank? ? all : where(conditions.join(", "))
  end
end
