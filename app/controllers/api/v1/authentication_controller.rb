module Api::V1
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def create
      @user = User.create(user_params)

      if @user.save
        render json: @user
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    def authenticate
      command = AuthenticateUser.call(params[:email], params[:password])
  
      if command.success?
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end

    private 

    def user_params
      params.permit(:email, :password, :username)
    end
  end
end
