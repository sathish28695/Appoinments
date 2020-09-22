require 'rails_helper'

RSpec::describe Patient, type: :model do

  #association tests
  describe 'association?' do
    it {should have_many(:doctors).through(:appointments).dependent(:destroy)}
  end

  #validation tests
  context 'valid?' do
    let!(:patient) { FactoryBot.create(:patient) }
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:auth_token)}
    it {should validate_uniqueness_of(:auth_token)}
  end
end