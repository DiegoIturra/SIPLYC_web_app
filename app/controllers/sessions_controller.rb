class SessionsController < BaseController

    def find_by_teacher
        sessions = Session.where(teacher_id: params[:teacher_id])
                    .includes(:student)
                    
        render json: sessions, status: :ok, include: [:student]
    end

    def update
        session = Session.find(params[:id])

        if session.update(resource_params)
            render json: session, status: :ok, include: [:student]
        else
            render json: session.errors, status: :unprocessable_entity
        end
    end

    def paginated
        page = (params[:page] || 1).to_i
        per_page = (params[:per_page] || 10).to_i
        
        sessions = Session.where(teacher_id: params[:teacher_id])
                            .includes(:student)
                            .page(page)
                            .per(per_page)

        total_count = Session.where(teacher_id: params[:teacher_id]).count
        
        total_pages = (total_count / per_page.to_f).ceil
        has_next = page < total_pages
        has_prev = page > 1

        render json: {
            sessions: sessions.as_json(include: [:student]),
            total_count: total_count,
            total_pages: total_pages,
            current_page: page,
            has_next: has_next,
            has_prev: has_prev
        }, status: :ok
    end

    private

    def resource_params
        params.require(:session).permit(:date_session, :hour, 
                :session_number, :state, :duration, :apk_version,
                :comments, :teacher_id, :student_id, :tablet_id)
    end

end
