class SessionsController < BaseController

    def find_by_teacher
        sessions = Session.where(teacher_id: params[:teacher_id])
                    .includes(:student)
                    
        render json: sessions, status: :ok, include: [:student]
    end

end
