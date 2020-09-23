Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      post '/login', to: 'users#login'
      post '/create_appointment', to: 'appointments#create_appointment',constraints: { id: /\d.+/ }
      get '/day_appointments', to: 'appointments#day_appointments'
      get '/week_appointments', to: 'appointments#week_appointments'
      get '/:doctor_id/day_appointments', to: 'appointments#doctor_appointments_for_day', constraints: { id: /\d.+/ }
      get '/:doctor_id/week_appointments', to: 'appointments#doctor_appointments_for_week',constraints: { id: /\d.+/ }
    end
  end
end
