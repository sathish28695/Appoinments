require 'rails_helper'

RSpec::describe Appointment, type: :model do
  
  let!(:appointment) {FactoryBot.create(:appointment)}
  let!(:appointment_list) {FactoryBot.create_list(:appointment, 2)}
  let!(:day_appointment_list) {FactoryBot.create_list(:day_appointment, 3)}

  #association tests
  describe 'association?' do
    it {should belong_to(:patient)}
    it {should belong_to(:doctor)}
  end
  
  #validation tests 
  context 'valid?' do
    it {should validate_presence_of(:appointment_date)}
  end

  it 'create resources' do
    expect(appointment_list.count).to eq(2)
  end

  it 'slot_available?' do
    random = FactoryBot.build(:appointment)
    expect(Appointment.slot_available?(appointment.appointment_date, appointment.doctor_id).count).to eq(1)
    expect(Appointment.slot_available?(random.appointment_date, random.doctor_id).count).to eq(0)
  end

  context 'when slot available' do 
    it 'creates appointment' do
      build_appointment = FactoryBot.build(:appointment)
      expect(build_appointment.create_appointment).to be true
    end
  end

  context 'when slot not available' do 
    it 'do not create appointment' do
      appointment.create_appointment
      expect(appointment.create_appointment).to be false
    end
  end

  it 'returns day appointments list' do 
   expect(Appointment.day.count).to eq(3)
  end

  it 'returns week appointments list' do 
   expect(Appointment.week.count).to eq(3)
  end

  it 'returns doctor appointment for the day' do
    expect(Appointment.doctor_appointments(appointment.doctor, "day").count).to eq(0)
    expect(Appointment.doctor_appointments(day_appointment_list[0].doctor, "day").count).to be >= 1
  end

  it 'returns doctor appointment for the week' do 
    expect(Appointment.doctor_appointments(appointment.doctor, "week").count).to eq(0)
    expect(Appointment.doctor_appointments(day_appointment_list[0].doctor, "week").count).to be >= 1
  end
end