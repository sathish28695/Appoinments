require "rails_helper"

RSpec.describe Api::V1::AppointmentsController, :type => :controller do
  
  let!(:appointment) { FactoryBot.build :appointment }
  let!(:appointment_list) {FactoryBot.create_list(:appointment, 2)}
  it 'create appointments' do
    params = {
      appointment_date: appointment.appointment_date,
      patient_id: appointment.patient_id,
      doctor_id: appointment.doctor_id
    }

    request.headers[:authorization] = appointment.patient.auth_token
    expect{post(:create_appointment, params: params )}.to change{Appointment.count}.by(1)
  end
end 