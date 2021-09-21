class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "plant not found"}, status: 201
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end