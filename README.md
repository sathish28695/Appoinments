# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  
  2.5

* System dependencies

* Configuration

* Database creation

  Default, provided by the rails

* Database initialization

* How to run the test suite

  bundle exec rspec spec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Endpoints list

  post '/login' -  login functionality.

  post '/create_appointment' - Create appointment based on slot availabilty.

  get '/day_appointments' - list appointments for the day for all the doctors.

  get '/week_appointments' - list appointments for the week for all the doctors.

  get '/:doctor_id/day_appointments' - list appointments for the day for specific doctors.

  get '/:doctor_id/week_appointments' - list appointments for the week for specific doctors.
