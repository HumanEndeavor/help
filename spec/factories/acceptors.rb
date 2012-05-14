# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :acceptor do
    first_name "MyString"
    last_name "MyString"
    address "MyText"
    zipcode 1
    state_id 1
    region "MyString"
    category_id 1
  end
end
