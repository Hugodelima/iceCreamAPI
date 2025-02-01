module Api
  module V1
    class SaleProductsController < ApplicationController
      before_action :set_sale_product, only: %i[show update destroy]

      # GET /sale_products
      def index
        sale_products = SaleProductFilter.retrieve_all.includes(:sale, :product)
        render json: sale_products.as_json(include: [:sale, :product]), status: :ok
      end

      # GET /sale_products/:id
      def show
        render json: @sale_product.as_json(include: [:sale, :product]), status: :ok
      end

      # POST /sale_products
      def create
        sale_product = SaleProduct.new(sale_product_params)

        if SaleProductService.save(sale_product)
          render json: sale_product.as_json(include: [:sale, :product]), status: :created
        else
          render json: { errors: sale_product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /sale_products/:id
      def update
        if SaleProductService.update(@sale_product, sale_product_params)
          render json: @sale_product.as_json(include: [:sale, :product]), status: :ok
        else
          render json: { errors: @sale_product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /sale_products/:id
      def destroy
        if SaleProductService.destroy(@sale_product)
          head :no_content
        else
          render json: { error: 'Failed to delete sale_product' }, status: :unprocessable_entity
        end
      end

      private

      def set_sale_product
        @sale_product = SaleProduct.includes(:sale, :product).find_by(id: params[:id])
        render json: { error: 'SaleProduct not found' }, status: :not_found if @sale_product.nil?
      end

      def sale_product_params
        params.require(:sale_product).permit(:rated, :quantity, :sale_id, :product_id)
      end
    end
  end
end
