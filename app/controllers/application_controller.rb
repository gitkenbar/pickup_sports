class ApplicationController < ActionController::API
    def authenticate_request
        headerReq = request.headers['Authorization']
        header = headerReq.split(' ').last if headerReq

        begin
          decoded = JWT.decode(header, Rails.application.secret_key_base).first
          @current_user = User.find(decoded["user_id"])
        rescue JWT::ExpiredSignature
            render json: {error: "Token has expired"}, status: :unauthorized
        rescue JWT::DecodeError
            render json: {error: "unauthorized"}, status: :unauthorized
        end
        
    end
end
