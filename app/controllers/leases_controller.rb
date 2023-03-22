class LeasesController < ApplicationController

    def index
        render json: Lease.all
    end

    def create 
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        render json: {}, status: 200
    end

    private

    def not_found
        render json: {error: "Lease not found"}, status: 404
    end
    
    #strong param
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
