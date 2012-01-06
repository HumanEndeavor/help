module PeopleHelper


  def fullname first_name, last_name
    "#{first_name}".capitalize + " " + "#{last_name}".capitalize
  end

  def child_details person
    string = ""
    string << "#{fullname person.first_name person.second_name} is a #{person.gender} from #{get_district_name person.district_id}"
    string << ",#{get_state_name person.state_id}. He has studied till #{person.qualification} standard. The average family income #{person.family_income}. "
    string
  end

  def get_state_name state_id
    State.name.where(:id => state_id)
  end

  def get_district_name district_id
    District.name.where(:id => district_id)
  end

end