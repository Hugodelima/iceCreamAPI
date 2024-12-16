module Api
    module V1
        class SalesController < ApplicationController
            before_action :set_sale, only: %i[show update destroy]
    
            def index
            sales = SalesFilter.retrieve_all
            render json: sales, status: :ok
            end
    
            def show
            render json: @sale, status: :ok
            end
    
            def create
                sale = Sale.new(sale_params)
                if SalesService.save(sale)
                    render json: sale, status: :created
                else
                    render json: { errors: sale.errors.full_messages }, status: :unprocessable_entity
                end
            end

            def update
                if SalesService.update(@sale, sale_params)
                    render json: @sale, status: :ok
                else
                    render json: { errors: @sale.errors.full_messages }, status: :unprocessable_entity
                end
            end

            def destroy
                if SalesService.destroy(@sale)
                    head :no_content
                else
                    render json: { error: 'Failed to delete sale' }, status: :unprocessable_entity
                end
            end
    
            private

            def sale_params
                params.require(:sale).permit(:amount, :sale_date, :user_id)
            end

            def set_sale
                @sale = Sale.find_by(id: params[:id])
                render json: { error: 'Sale not found' }, status: :not_found if @sale.nil?
            end
        end
    end
end
  