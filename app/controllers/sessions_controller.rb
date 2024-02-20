class SessionsController < ApplicationController

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
          render json: {user: UserSerializer.new(user)}
        else
          render json: {errors: "Invalid Username and/or Password, get good!"}, status: :forbidden
        end
    end
    
      def autologin
        render json: {user: UserSerializer.new(logged_in_user)}
      end
end
