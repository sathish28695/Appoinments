class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, :through => :appointments, :dependent => :destroy
  validates_presence_of :name
end
