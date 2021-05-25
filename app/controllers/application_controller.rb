class ApplicationController < ActionController::API

  def encode_token(user_id)
    exp = Time.now.to_i + 3600
    payload = { user_id: user_id, exp: exp }
    JWT.encode(payload, 'secret', 'HS256')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        @message = 'InvalidToken'
      rescue JWT::ExpiredSignature
        @message = 'TokenExpired'
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    @message = 'Please Log in'
    render json: { message: @message }, status: :unauthorized unless logged_in?
  end

end
