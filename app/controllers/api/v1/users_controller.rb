class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, :except => [:login]
  def login
    user = Patient.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      render json: { status: true, message: 'Successfull login', auth_token: user.auth_token}, status: 200
    else
      render json: { status: false, message: 'Invalid login or password'}, status: 401
    end
  end
end