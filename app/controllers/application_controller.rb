class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Response
  include ExceptionHandler
  
  def authenticate_user
    @user = Patient.find_by_auth_token(request.headers[:authorization])
    unauthorized unless @user.present?
  end
end
