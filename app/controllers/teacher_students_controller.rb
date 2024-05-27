class TeacherStudentsController < BaseController
    def index
        all_assignments = TeacherStudent.includes(:teacher, :student)
        render json: all_assignments, include: [:teacher, :student], status: :ok
    end

    def show
        assignment = TeacherStudent.includes(:teacher, :student).find(params[:id])
        render json: assignment, include: [:teacher, :student], status: :ok
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
end