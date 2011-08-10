namespace :db do

  desc "populate data in states table"
  task :populate_states => [:environment] do
    states = ["Andhra Pradesh","Arunachal Pradesh","Assam","Madhya pradesh","Maharashtra"]
    states.each  do |st|
      State.create(:name => st)
    end
  end

  desc"populate details of people"
  task :populate_people_details => [:environment] do
    first_names = ["Amar", "Akbar", "Anthony"]
    last_names = ["Shah", "Ali", "Gonzalves"]
    qualifications = ["graduate", "post-graduate", "secondary pass"]
    Person.create(:first_name => first_names[0], :last_name => last_names[0], :emailid => "#{first_names[0]}.#{last_names[0]}@gmail.com", :sex => 'M', :address => 'Raigad village happy, Maharashtra 402305',        :state_id => State.find_by_name("Maharashtra").id, :qualification => qualifications[0], :job_status => 'Working as a secondary school teacher', :rural => true, :district_id => District.find_by_name("Raigad").id,:age => 30, :ngo_id => 1)
    Person.create(:first_name => first_names[1], :last_name => last_names[1], :emailid => "#{first_names[1]}.#{last_names[1]}@gmail.com", :sex => 'M', :address => 'Pune, Maharashtra 411027',        :state_id => State.find_by_name("Maharashtra").id, :qualification => qualifications[1], :job_status => 'Working as a college school teacher', :rural => false, :district_id => District.find_by_name("Pune").id,:age => 30, :ngo_id => 1)
    Person.create(:first_name => first_names[2], :last_name => last_names[2], :emailid => "#{first_names[2]}.#{last_names[2]}@gmail.com", :sex => 'M', :address => 'Mumbai city, Maharashtra 400076',        :state_id => State.find_by_name("Maharashtra").id, :qualification => qualifications[2], :job_status => 'Working as a secondary school teacher', :rural => false, :district_id => District.find_by_name("Mumbai").id,:age => 30, :ngo_id => 1)
  end
  

  #      ActiveRecord::Base.connection.execute('insert into states values
  #(1,"Andhra Pradesh"),
  #(2,"Arunachal Pradesh"),
  #(3,"Assam"),
  #(4,"Bihar"),
  #(5,"Chhattisgarh"),
  #(6,"Goa"),
  #(7,"Gujarat"),
  #(8,"Haryana"),
  #(9,"Himachal Pradesh"),
  #(10,"Jammu and Kashmir"),
  #(11,"Jharkhand"),
  #(12,"Karnataka"),
  #(13,"Kerala"),
  #(14,"Madhya Pradesh"),
  #(15,"Maharashtra"),
  #(16,"Manipur"),
  #(17,"Meghalaya"),
  #(18,"Mizoram"),
  #(19,"Nagaland"),
  #(20,"Orissa"),
  #(21,"Punjab"),
  #(22,"Rajasthan"),
  #(23,"Sikkim"),
  #(24,"Tamil Nadu"),
  #(25,"Tripura"),
  #(26,"Uttar Pradesh"),
  #(27,"Uttarakhand"),
  #(28,"West Bengal"),
  #(29,"Union Territories:"),
  #(30,"Andaman and Nicobar Islands"),
  #(31,"Chandigarh"),
  #(32,"Dadra and Nagar Haveli"),
  #(33,"Daman and Diu"),
  #(34,"Lakshadweep"),
  #(35,"National Capital Territory of Delhi"),
  #(36,"Puducherry")
  #')

  desc "populate data in categories table"
  task :populate_categories => [:environment] do
    categories = ["education","orphanages","oldage support","generate employment","support"]
    categories.each do |ct|
      Category.create(:name => ct)
    end
  end

  desc "populate data in districts table"
  task :populate_districts => [:environment] do
    ["Mumbai", "Pune", "Raigad"].each do |dist|
      District.create(:name => dist, :state_id => State.find_by_name("Maharashtra").id)
    end
  end

  desc "populate data in ngos table"
  task :populate_ngos => [:environment] do
    ["Ngo1", "Ngo2", "Ngo3"].each do |ngo|
      Ngo.create(:name => ngo,
        :state_id => State.find_by_name("Maharashtra").id,
        :district_id => District.find_by_name("Mumbai"),
        :category_id => Category.find_by_name("education"))
    end
  end

  #
  #  desc "populate data in ngos_states table"
  #  task :populate_ngos_states => [:environment] do
  #
  #        NgoState.create(:state_id => State.find_by_name("Maharashtra").id,
  #        :ngo_id => Ngo.find_by_name('Ngo1'))
  #
  #  end
  #  desc "Populate categories, states and distrcts table."
  task :load => [ :populate_categories, :populate_states, :populate_districts,:populate_ngos ]
end