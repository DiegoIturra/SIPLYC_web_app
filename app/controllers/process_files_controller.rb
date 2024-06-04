require 'json'

class ProcessFilesController < ApplicationController

    def process_excel_file
        items_params = params.require(:data)

        items_params.each do |item|

            # Step1: Create City
            city = City.find_or_create_by(name: item[:city])

            # Step2: Create KinderGarden
            kinder_garden = KinderGarden.find_or_create_by(name: item[:kinder_garden], city_id: city.id)

            # Step3: Create AgeRange
            age_range = AgeRange.find_or_create_by(name: item[:age_range])

            # Step4: Create Tablet
            Tablet.find_or_create_by(model: item[:tablet])

            # Step5: Create Student
            names = item[:names]
            father_lastname = item[:father_lastname]
            mother_lastname = item[:mother_lastname]
            rut = item[:rut]

            student = Student.find_or_create_by(names: names, father_lastname: father_lastname, 
                        mother_lastname: mother_lastname, rut: rut, 
                        kinder_garden_id: kinder_garden.id, 
                        age_range_id: age_range.id)
        end

        render json: { items: items_params }, status: :ok
    end

end