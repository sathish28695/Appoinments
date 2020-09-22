module Response
  def json_response(object, status= 200)
    render json: {status: true}.merge!(object), status:status
  end

  def unauthorized
    render json: {status: false, message: 'Unauthorized'}, status: 401
  end

  def error(message = 'Something went wrong')
    render json: {status: false, message: message}, status: 500
  end
end