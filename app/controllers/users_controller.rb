class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            user.save
            render json: user
        else  
            render json: { error: user.errors }, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    rescue => e
        render json: { error: 'User not found.' }, status: :not_found
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end
