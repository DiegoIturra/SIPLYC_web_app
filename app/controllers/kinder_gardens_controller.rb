require 'json'

class KinderGardensController < BaseController

    # TODO: Base controller could be improved to handle this joins and selects with other tables
    def index
        @kinder_gardens = KinderGarden.joins(:city)
            .select('kinder_gardens.*, cities.name as city_name')
        
            render json: @kinder_gardens, status: :ok
    end
    

    def show
        @kinder_garden = KinderGarden.joins(:city)
                    .select('kinder_gardens.*, cities.name as city_name')
                    .find(params[:id])

        render json: @kinder_garden, status: :ok
    end

    def paginated
        page = (params[:page] || 1).to_i
        per_page = (params[:per_page] || 10).to_i
        
        kinder_gardens = KinderGarden.joins(:city)
                        .select('kinder_gardens.*, cities.name as city_name')
                        .page(page)
                        .per(per_page)

        total_count = KinderGarden.count
        total_pages = (total_count / per_page.to_f).ceil
        has_next = page < total_pages
        has_prev = page > 1

        render json: {
            kinder_gardens: kinder_gardens.as_json(include: [:city]),
            total_count: total_count,
            total_pages: total_pages,
            current_page: page,
            has_next: has_next,
            has_prev: has_prev
        }, status: :ok
    end

    private

    def resource_params
        params.require(:kinder_garden).permit(:name, :phone, :address, :city_id)
    end
end