class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
    #/tenants/
    def index
        render json: Tenant.all, status: :ok
    end

    def create
        tenant = t.create!(apartment_params)
        render json: tenant, status: :created
    end

    #/tenants/:id
    def show
        tenant = Tenant.find(params[:id])
        render json: tenant, status: :ok
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        render json: tenant, status: :ok
    end

    #/tenants/:id
    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        render json: {}, status: 200
    end

    private
    def not_found
        render json: {error: "Tenant not found"}, status: 404
    end

    def tenant_params
        params.permit(:name,:age )
    end
end


