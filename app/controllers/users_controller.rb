class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            render json: {user: UserSerializer.new(user), token: encode_token(user.id)}
        else
            render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end
        
    end

    private

    def user_params
        params.permit(:username, :password, :email)
    end
end
