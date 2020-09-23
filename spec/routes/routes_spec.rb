require 'rails_helper'

RSpec.describe 'API Endpoints', :type => :routing do
  describe "routing" do
    it "routes to user login" do
      expect(:post => '/api/v1/login').to route_to('api/v1/users#login') 
    end

    it 'routes to create appointments' do
      expect(:post => '/api/v1/create_appointment').to route_to('api/v1/appointments#create_appointment')
    end

    it 'routes to list day appointments' do
      expect(:get => '/api/v1/day_appointments').to route_to('api/v1/appointments#day_appointments')
    end

    it 'routes to list weekly appointments' do
      expect(:get => '/api/v1/week_appointments').to route_to('api/v1/appointments#week_appointments')
    end
  end
end