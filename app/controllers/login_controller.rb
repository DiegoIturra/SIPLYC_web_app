class LoginController < ApplicationController

    def login
        user_params = params.require(:user).permit(:email, :password)
        
        user = User.find_by(email: user_params[:email], password: user_params[:password])
        
        if can_login?(user, user_params)
            render json: { user: user }, status: :ok
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    private

    def can_login?(user, params)
        user && params[:email] == user[:email] && params[:password] == user[:password]
    end
    
end