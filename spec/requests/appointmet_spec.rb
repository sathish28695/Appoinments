require 'rails_helper'

RSpec.describe 'Appointment', type: :request do
  
  let!(:patient) { FactoryBot.create(:patient)}
  let!(:doctor) { FactoryBot.create(:doctor)}
  it 'creates a appointment' do
    post '/api/v1/create_appointment', params: {:appointment_date => "2020-09-23", :patient_id => patient.id, :doctor_id => doctor.id}, headers: {:authorization => patient.auth_token}
    expect(response).to have_http_status(201)
  end
end