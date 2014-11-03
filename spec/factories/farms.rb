FactoryGirl.define do
  factory :farm do
    name { Faker::Company.name }    
    city { Faker::Address.city }
  end

end
