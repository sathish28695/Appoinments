FactoryBot.define do
  factory :appointment do
    appointment_date {Faker::Date.in_date_period}
    association :patient, factory: :patient
    association :doctor, factory: :doctor 
  end

  factory :day_appointment, :class => 'Appointment' do
    appointment_date {Faker::Date.between(from: Date.today, to: Date.today)}
    association :patient, factory: :patient
    association :doctor, factory: :doctor
  end
end