class Patient < ApplicationRecord
  self.table_name = "users"
  has_many :appointments
  has_many :doctors, :through => :appointments
end
