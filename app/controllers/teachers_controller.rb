class TeachersController < ApplicationController
    before_action :set_teacher, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @teachers = Teacher.all
        render json: @teachers, status: :ok
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save
            render json: @teacher, status: :created, location: @teacher
        else
          render json: @teacher.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @teacher
    end

    def update
        if @teacher.update(teacher_params)
            render json: @teacher
        else
            render json: @teacher.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @teacher.destroy
    end

    private

    def set_teacher
        @teacher = Teacher.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def teacher_params
        params.require(:teacher).permit(:names, :rut, :father_lastname, :mother_lastname, :email, :password)
    end

end
