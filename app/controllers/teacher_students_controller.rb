class TeacherStudentsController < BaseController
    def index
        all_assignments = TeacherStudent.includes(:teacher, :student)
        render json: all_assignments, include: [:teacher, :student], status: :ok
    end

    def show
        assignment = TeacherStudent.includes(:teacher, :student).find(params[:id])
        render json: assignment, include: [:teacher, :student], status: :ok
    end
end