module Errors
  BAD_REQUEST = 400
  BAD_REQUEST_MESSAGE = 'Bad request'

  UNAUTHORIZED = 401
  UNAUTHORIZED_MESSAGE = 'Unauthorized'

  FORBIDDEN = 403
  FORBIDDEN_MESSAGE = 'Forbidden'

  NOT_FOUND = 404
  NOT_FOUND_MESSAGE = 'Not found'

  CONFLICT = 409
  CONFLICT_MESSAGE = 'Conflict'

  INVALID_TOKEN_MESSAGE = 'Invalid Token'
  TOKEN_EXPIRED_MESSAGE = 'Token Expired'


  class BadRequest < StandardError
    def message
      BAD_REQUEST_MESSAGE
    end

    def status_code
      BAD_REQUEST
    end
  end

  class UnAuthorized < StandardError
    def message
      UNAUTHORIZED_MESSAGE
    end

    def status_code
      UNAUTHORIZED
    end

  end


  class Forbidden < StandardError
    def message
      FORBIDDEN_MESSAGE
    end

    def status_code
      FORBIDDEN
    end
  end

  class NotFound < StandardError
    def message
      NOT_FOUND_MESSAGE
    end

    def status_code
      NOT_FOUND
    end
  end

  class Conflict < StandardError
    def message
      CONFLICT_MESSAGE
    end

    def status_code
      CONFLICT
    end
  end

  class InvalidToken < StandardError
    def message
      INVALID_TOKEN_MESSAGE
    end

    def status_code
      UNAUTHORIZED
    end
  end

  class TokenExpired < StandardError
    def message
      TOKEN_EXPIRED_MESSAGE
    end

    def status_code
      UNAUTHORIZED
    end
  end



end