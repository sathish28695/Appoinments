require 'rails_helper'

RSpec.describe 'User', :type => :request do
  describe 'login' do
    let!(:patient) {FactoryBot.create(:patient) }
    before { post '/api/v1/login', params: {name: patient.name, password: patient.password}}

    describe ".authenticate" do
      it {expect(JSON.parse(response.body)["auth_token"]).to eq(patient.auth_token)}
    end

    context 'when logged in' do
      it { expect(response.content_type).to eq("application/json") }
      it {expect(response).to have_http_status(200) }
    end
  end
end