FactoryBot.define do
  factory :appointment do
    appointment_date {Faker::Date.in_date_period}
    association :patient, factory: :patient
    association :doctor, factory: :doctor 
  end
end