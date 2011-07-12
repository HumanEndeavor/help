namespace :db do

  desc "populate data in states table"
  task :populate_states => [:environment] do
    states = ["Andhra Pradesh","Arunachal Pradesh","Assam","Madhya pradesh","Maharashtra"]
    states.each  do |st|
      State.create(:name => st)
    end
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
        Ngo.create(:name => ngo, :state_id => State.find_by_name("Maharashtra").id,
        :district_id => District.find_by_name("Mumbai"),
        :category_id => Category.find_by_name("education"))
    end
  end

  #  desc "Populate categories, states and distrcts table."
  #  task :load => [ :populate_categories, :populate_states, :populate_districts ]
end