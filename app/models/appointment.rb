class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates_presence_of :appointment_date
  validates_format_of :appointment_date, :with => /^\d{4}-\d{2}-\d{2}/,multiline: true

  scope :slot_available?, -> (date, doctor) { where(:appointment_date => date, :doctor_id => doctor)}

  def create_appointment
    unless self.class.slot_available?(self.appointment_date, self.doctor_id).present?
      save
      return true
    else
      return false
    end
  end

  def self.day
    Appointment.select{|a| a.appointment_date == Date.today}
  end

  def self.week
    Appointment.select{|a| a.appointment_date.cweek == Date.today.cweek}
  end

  def self.doctor_appointments(doctor, date)
    if date == "day"
      self.day.select{|a| a.doctor_id == doctor.id}
    else
      self.week.select{|a| a.doctor_id == doctor.id}
    end
  end
end
