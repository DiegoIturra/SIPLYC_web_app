class ProcessFilesController < ApplicationController

    def process_excel_file
        items_params = params.require(:data)

        puts "showing parameters #{items_params}"

        cities = []
        kinder_gardens = []

        items_params.each do |item|
            city = City.where(name: item[:city]).take
            cities << city

            # if city doesn't exist, then save in BD
            # Do the same for other properties

            # get child data
            # if exist a child whose names, father_lastname
            # mother_lastname and rut are exactly then asosciate
            # info with that child

            kinder_garden = KinderGarden.where(name: item[:kinder_garden]).take
            
            if kinder_garden
                kinder_gardens << kinder_garden
            end
            
        end

        render json: kinder_gardens, status: :ok
    end
end