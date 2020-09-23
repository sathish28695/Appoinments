class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user, :only => [:create_appointment]
  before_action :verify_user_id?, :only => [:create_appointment]
  before_action :find_doctor, :only => [:doctor_appointments_for_day, :doctor_appointments_for_week]

  def create_appointment
    begin
      appointment = Appointment.new(appointment_params)
      if appointment.create_appointment
        json_response({message: 'Appoinment booked successfully'}, status = 201)
      else
        json_response({status: false, message: 'Slot not available, Please select a different date'})
      end
    rescue Exception => e
      error(e.message)
    end
  end

  def day_appointments
    appointments = Appointment.day.as_json
    json_response({appointments: appointments})
  end

  def week_appointments
    appointments = Appointment.week.as_json
    json_response({appointments: appointments})
  end

  def doctor_appointments_for_day
    appointments = Appointment.doctor_appointments(@doctor, 'day')
    json_response({appointments: appointments})
  end

  def doctor_appointments_for_week
    appointments = Appointment.doctor_appointments(@doctor, 'week')
    json_response({appointments: appointments})
  end

  def verify_user_id?
    unauthorized unless params[:patient_id].to_i == @user.id
  end

  private

  def appointment_params
    params.permit(:appointment_date, :patient_id, :doctor_id)
  end

  def find_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end