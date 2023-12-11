class KinderGardenController < ApplicationController
    before_action :set_kinder_garden, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @kinder_gardens = KinderGarden.all
        render json: @cities, status: :ok
    end

    def create
        @kinder_garden = KinderGarden.new(kinder_garden_params)

        if @kinder_garden.save
            render json: @kinder_garden, status: :created, location: @kinder_garden
        else
          render json: @kinder_garden.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @kinder_garden
    end

    def update
        if @kinder_garden.update(kinder_garden_params)
            render json: @kinder_garden
        else
            render json: @kinder_garden.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @kinder_garden.destroy
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_kinder_garden
        @kinder_garden = KinderGarden.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def kinder_garden_params
        params.require(:kinder_garden).permit(:name, :address, :phone, :city_id)
    end
end
