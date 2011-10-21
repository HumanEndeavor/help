module PeopleHelper


  def fullname first_name, last_name
    "#{first_name}".capitalize + " " + "#{last_name}".capitalize
  end
end