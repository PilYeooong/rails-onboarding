class ApplicationController < ActionController::API
  rescue_from Errors::BadRequest, with: :handle_error
  rescue_from Errors::UnAuthorized, with: :handle_error
  rescue_from Errors::Forbidden, with: :handle_error
  rescue_from Errors::NotFound, with: :handle_error
  rescue_from Errors::Conflict, with: :handle_error
  rescue_from Errors::InvalidToken, with: :handle_error
  rescue_from Errors::TokenExpired, with: :handle_error

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
        raise Errors::InvalidToken
      rescue JWT::ExpiredSignature
        raise Errors::TokenExpired
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
    raise Errors::UnAuthorized unless logged_in?
  end

  private
    def handle_error(e)
      render json: { errors: e.message }, status: e.status_code
    end

end
