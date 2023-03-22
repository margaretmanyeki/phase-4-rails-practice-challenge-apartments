class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index 
        apartments = Apartment.all
        render json: apartments, status: :ok
    end 

    def show 
         apartment = Apartment.find_by(params[:id])
        render json: apartment, status: :ok
    end

    #use strong param and private mthd
    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params([:id]))
        apartment.update(apartment_params)
        render json: apartment, status: :ok

    end

    def destroy
        apartment = Apartment.find(params([:id]))
        apartment.destroy(apartment_params)
        render json: apartment, status: :ok
        #head: no_content

    end

    private

    def apartment_params
        params.permit(:number)
    end
    def record_not_found(error)
        render json: {error: error.message}, status: :not_found

    end
end


