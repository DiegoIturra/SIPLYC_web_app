class StudentsController < BaseController
    def index
        @students = Student.includes(:kinder_garden, :age_range)
        render json: @students, include: [:kinder_garden, :age_range], status: :ok
    end

    def show
        @student = Student.includes(:kinder_garden, :age_range).find(params[:id])
        render json: @student, include: [:kinder_garden, :age_range], status: :ok
    end

    private
    def student_params
        params.require(:student).permit(:rut, :names, :father_lastname, 
            :mother_lastname, :birthday, :gender, :group, :comments, :email, 
            :password, :state, :kinder_garden_id, :age_range_id)
    end
end