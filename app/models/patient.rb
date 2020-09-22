class Patient < ApplicationRecord
	has_secure_password
  self.table_name = "users"
  has_many :appointments
  has_many :doctors, :through => :appointments, :dependent => :destroy

  validates :auth_token, uniqueness: true
  validates_presence_of :name, :auth_token
  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless Patient.find_by(auth_token: auth_token) 
    end
  end
end
