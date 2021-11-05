class LeasesController < ApplicationController
    def create
        lease = Lease.create(lease_params)
        if lease.valid?
            render json: lease, status: :created
        else
            render json: { errors: lease.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end
end