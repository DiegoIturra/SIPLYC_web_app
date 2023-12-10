class UsersController < ApplicationController
    before_action :set_user, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @user
    end

    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def user_params
        params.require(:user).permit(:names, :surname, :second_surname, :email, :password, :role_id)
    end

end
