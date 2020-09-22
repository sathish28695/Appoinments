require 'rails_helper'

RSpec::describe Appointment, type: :model do

  #association tests
  describe 'association?' do
    it {should belong_to(:patient)}
    it {should belong_to(:doctor)}
  end
  
  #validation tests 
  context 'valid?' do
    let!(:appointment) {FactoryBot.create(:appointment)}
    it {should validate_presence_of(:appointment_date)}
  end
end