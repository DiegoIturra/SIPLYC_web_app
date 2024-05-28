class TeacherStudentsController < BaseController
    def index
        all_assignments = TeacherStudent.includes(:teacher, :student)
        render json: all_assignments, include: [:teacher, :student], status: :ok
    end

    def show
        assignment = TeacherStudent.includes(:teacher, :student).find(params[:id])
        render json: assignment, include: [:teacher, :student], status: :ok
    end


    def update
        assignment = TeacherStudent.find(params[:id])
        if assignment.update(resource_params)
            render json: assignment, include: [:teacher, :student], status: :ok
        else
            render json: assignment.errors, status: :unprocessable_entity
        end

    end

    def paginated
        page = (params[:page] || 1).to_i
        per_page = (params[:per_page] || 10).to_i
        
        assignments = TeacherStudent.includes(:teacher, :student).page(page).per(per_page)
        total_count = TeacherStudent.count
        total_pages = (total_count / per_page.to_f).ceil
        has_next = page < total_pages
        has_prev = page > 1

        render json: {
            assignments: assignments.as_json(include: [:teacher, :student]),
            total_count: total_count,
            total_pages: total_pages,
            current_page: page,
            has_next: has_next,
            has_prev: has_prev
        }, status: :ok
    end

    private
    
    def resource_params
        params.require(:teacher_student).permit(:teacher_id, :student_id)
    end
end