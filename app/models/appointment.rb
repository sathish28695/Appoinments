class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates_presence_of :appointment_date
  validates_format_of :appointment_date, :with => /^\d{4}-\d{2}-\d{2}/,multiline: true
end
