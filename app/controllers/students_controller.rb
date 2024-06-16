class StudentsController < BaseController
    def index
        @students = Student.includes(:kinder_garden, :age_range)
        render json: @students, include: [:kinder_garden, :age_range], status: :ok
    end

    def show
        @student = Student.includes(:kinder_garden, :age_range).find(params[:id])
        render json: @student, include: [:kinder_garden, :age_range], status: :ok
    end

    def paginated
        page = (params[:page] || 1).to_i
        per_page = (params[:per_page] || 10).to_i
        
        students = Student.page(page).per(per_page)
        total_count = Student.count
        total_pages = (total_count / per_page.to_f).ceil
        has_next = page < total_pages
        has_prev = page > 1

        render json: {
            students: students.as_json(),
            total_count: total_count,
            total_pages: total_pages,
            current_page: page,
            has_next: has_next,
            has_prev: has_prev
        }, status: :ok
    end

    private
    def student_params
        params.require(:student).permit(:rut, :names, :father_lastname, 
            :mother_lastname, :birthday, :gender, :group, :comments, :email, 
            :password, :state, :kinder_garden_id, :age_range_id)
    end
end