class BaseController < ApplicationController

    before_action :set_resource, only: %i[show update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        @resources = resource_model.all
        render json: @resources, status: :ok
    end

    def create
        @resource = resource_model.new(resource_params)
    
        if @resource.save
            render json: @resource, status: :created, location: @resource
        else
            render json: @resource.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @resource
    end

    def update
        if @resource.update(resource_params)
            render json: @resource
        else
            render json: @resource.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @resource.destroy
    end
    
    private

    def set_resource
        @resource = resource_model.find(params[:id])
    end

    def record_not_found
        render json: { 'error': 'Record not found' }, status: :not_found
    end

    def resource_params
        params.require(resource_name.to_sym).permit!
    end

    def resource_model
        controller_name.classify.constantize
    end
    
    def resource_name
        controller_name.singularize
    end
end    
