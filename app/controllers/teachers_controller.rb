class TeachersController < BaseController

    def paginated
        page = (params[:page] || 1).to_i
        per_page = (params[:per_page] || 10).to_i
        
        teachers = Teacher.page(page).per(per_page)
        total_count = Teacher.count
        total_pages = (total_count / per_page.to_f).ceil
        has_next = page < total_pages
        has_prev = page > 1

        render json: {
            teachers: teachers.as_json(),
            total_count: total_count,
            total_pages: total_pages,
            current_page: page,
            has_next: has_next,
            has_prev: has_prev
        }, status: :ok
    end

end