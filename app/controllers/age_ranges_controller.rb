class AgeRangesController < ApplicationController
    before_action :set_age_range, only: %i[ show update destroy ]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @age_ranges = AgeRange.all
        render json: @age_ranges, status: :ok
    end

    def create
        @age_range = AgeRange.new(age_range_params)

        if @age_range.save
            render json: @age_range, status: :created, location: @age_range
        else
          render json: @age_range.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @age_range
    end

    def update
        if @age_range.update(age_range_params)
            render json: @age_range
        else
            render json: @age_range.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @age_range.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_age_range
        @age_range = AgeRange.find(params[:id])
    end

    def record_not_found
        render json: {'error': 'Record not found'}, status: :not_found
    end

    def age_range_params
        params.require(:age_range).permit(:name, :min_age, :max_age)
    end
end
