class StudentsController < ApplicationController
    before_action :set_student, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @students = Student.all
        render json: @students, status: :ok
    end

    def create
        @student = Student.new(student_params)

        if @student.save
            render json: @student, status: :created, location: @student
        else
          render json: @student.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @student
    end

    def update
        if @student.update(student_params)
            render json: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @student.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student
        @student = Student.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def student_params
        params.require(:student).permit(:names, :rut, :father_lastname, 
                    :mother_lastname, :birthday, :gender, :group, :comments, 
                    :email, :password, :state, :kinder_garden_id, :age_range_id
        )
    end
end
