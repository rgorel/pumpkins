FactoryGirl.define do
  factory :pumpkin do
    name { Faker::Name.name }
    weight { rand 2000...3000 }    
    softness { %w(hard middle soft).sample }
    farm
  end

end
