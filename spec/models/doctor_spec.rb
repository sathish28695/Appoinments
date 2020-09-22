require 'rails_helper'

RSpec::describe Doctor, type: :model do

  #association tests
  describe 'association?' do 
    it {should have_many(:patients).through(:appointments).dependent(:destroy)}
  end

  #validation tests
  context 'valid?' do
    let!(:doctor) {FactoryBot.create(:doctor)}
    it {should validate_presence_of(:name)} 
  end
end