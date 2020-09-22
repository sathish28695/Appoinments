module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ status: false, message: e.message }, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ status: false, message: e.message }, 401)
    end
  end
end