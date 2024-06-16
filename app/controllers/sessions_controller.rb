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

    private

    def resource_params
        params.require(:session).permit(:date_session, :hour, 
                :session_number, :state, :duration, :apk_version,
                :comments, :teacher_id, :student_id, :tablet_id)
    end

end
