namespace :db do

desc "populate data in states table"
task :populate_states => [:environment] do
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_s)
    ActiveRecord::Base.connection.execute('insert into states values
(1,"Andhra Pradesh"),
(2,"Arunachal Pradesh"),
(3,"Assam"),
(4,"Bihar"),
(5,"Chhattisgarh"),
(6,"Goa"),
(7,"Gujarat"),
(8,"Haryana"),
(9,"Himachal Pradesh"),
(10,"Jammu and Kashmir"),
(11,"Jharkhand"),
(12,"Karnataka"),
(13,"Kerala"),
(14,"Madhya Pradesh"),
(15,"Maharashtra"),
(16,"Manipur"),
(17,"Meghalaya"),
(18,"Mizoram"),
(19,"Nagaland"),
(20,"Orissa"),
(21,"Punjab"),
(22,"Rajasthan"),
(23,"Sikkim"),
(24,"Tamil Nadu"),
(25,"Tripura"),
(26,"Uttar Pradesh"),
(27,"Uttarakhand"),
(28,"West Bengal"),
(29,"Union Territories:"),
(30,"Andaman and Nicobar Islands"),
(31,"Chandigarh"),
(32,"Dadra and Nagar Haveli"),
(33,"Daman and Diu"),
(34,"Lakshadweep"),
(35,"National Capital Territory of Delhi"),
(36,"Puducherry")
')
end

  desc "populate data in categories table"
  task :populate_categories => [:environment] do
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_s)
    ActiveRecord::Base.connection.execute('insert into categories values
(1,"education"),
(2,"orphanages"),
(3,"oldage support"),
(4,"generate employment"),
(5,"support")')
end

  desc "populate data in districts table"
  task :populate_districts => [:environment] do
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_s)
    ActiveRecord::Base.connection.execute('insert into districts values
(1,15,"Mumbai City"),
(2,15,"Pune "),
(3,15,"Raigad")')
end

  desc "Populate categories, states and distrcts table."
  task :load => [ :populate_categories, :populate_states, :populate_districts ]
end