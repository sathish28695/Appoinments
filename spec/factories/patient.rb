FactoryBot::define do
  factory :patient do
    name {Faker::Name.unique.name}
    password {Faker::String.random(length: 4)}
    auth_token {Faker::Number.number(digits: 10)}
  end 
end