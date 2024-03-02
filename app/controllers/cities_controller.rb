class CitiesController < ApplicationController
    before_action :set_city, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @cities = City.all
        render json: @cities, status: :ok
    end

    def create
        @city = City.new(city_params)

        if @city.save
            render json: @city, status: :created, location: @city
        else
          render json: @city.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @city
    end

    def update
        if @city.update(city_params)
            render json: @city
        else
            render json: @city.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @city.destroy
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_city
        @city = City.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def city_params
        params.require(:city).permit(:name)
    end
end
