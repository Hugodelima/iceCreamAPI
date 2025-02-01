module Api
    module V1
      class SalesController < ApplicationController
        before_action :set_sale, only: %i[show update destroy]
  
        # GET /sales
        def index
          sales = SalesFilter.retrieve_all.includes(:sale_products, :products)
          render json: sales.as_json(include: { sale_products: { include: :product } }), status: :ok
        end
  
        # GET /sales/:id
        def show
          render json: @sale.as_json(include: { sale_products: { include: :product } }), status: :ok
        end
  
        # POST /sales
        def create
          sale = Sale.new(sale_params)
          if SalesService.save(sale)
            render json: sale.as_json(include: { sale_products: { include: :product } }), status: :created
          else
            render json: { errors: sale.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /sales/:id
        def update
          if SalesService.update(@sale, sale_params)
            render json: @sale.as_json(include: { sale_products: { include: :product } }), status: :ok
          else
            render json: { errors: @sale.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # DELETE /sales/:id
        def destroy
          if SalesService.destroy(@sale)
            head :no_content
          else
            render json: { error: 'Failed to delete sale' }, status: :unprocessable_entity
          end
        end
  
        private
  
        def set_sale
          @sale = Sale.includes(:sale_products, :products).find_by(id: params[:id])
          render json: { error: 'Sale not found' }, status: :not_found if @sale.nil?
        end
  
        def sale_params
          params.require(:sale).permit(
            :amount, 
            :sale_date, 
            :user_id, 
            sale_products_attributes: %i[product_id quantity rated]
          )
        end
      end
    end
  end
  