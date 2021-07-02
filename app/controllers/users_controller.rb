class UsersController < ApplicationController
    def show
        render json: User.find(params[:id])
    rescue => e
        render json: { error: 'User not found.' }, status: :not_found
    end

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: user
        else
            create_user
        end
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end

    def create_user
        user = User.create(user_params)
        if user.valid?
            user.save
            render json: user
        else  
            render json: { error: user.errors }, status: :unprocessable_entity
        end
    end
end
