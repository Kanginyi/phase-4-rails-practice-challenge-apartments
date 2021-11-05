class TenantsController < ApplicationController
    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        if tenant.valid?
            render json: tenant, status: :ok
        else
            render json: { errors: tenant.errors }, status: :unprocessable_entity
        end
    end

    def create
        tenant = Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant, status: :created
        else
            render json: { errors: tenant.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private
    def tenant_params
        params.permit(:name, :age)
    end
end