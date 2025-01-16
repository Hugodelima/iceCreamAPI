module Api
    module V1
        class UserRateProductsController < ApplicationController

            before_action :set_user_rate_product, only: %i[show update destroy]
    
            def index
                user_rate_products = UserRateProductFilter.retrieve_all
                render json: user_rate_products, status: :ok
            end
    
            def show
                render json: @user_rate_product, status: :ok
            end
    
            def create
                user_rate_product = UserRateProduct.new(user_rate_product_params)
                if UserRateProductService.save(user_rate_product)
                    render json: user_rate_product, status: :created
                else
                    render json: { errors: user_rate_product.errors.full_messages }, status: :unprocessable_entity
                end
            end

    
            def update
                if UserRateProductService.update(@user_rate_product, user_rate_product_params)
                    render json: @user_rate_produc, status: :ok
                else
                    render json: { errors: @user_rate_produc.errors.full_messages }, status: :unprocessable_entity
                end
            end
    
            def destroy
                if UserRateProductService.destroy(@user_rate_product)
                    head :no_content
                else
                    render json: { error: 'Failed to delete user_rate_product' }, status: :unprocessable_entity
                end
            end
    
            private
    
            def set_user_rate_product
                @user_rate_product = UserRateProduct.find_by(id: params[:id])
                render json: { error: 'UserRateProduct not found' }, status: :not_found if @user_rate_product.nil?
            end
    
            def user_rate_product_params
                params.require(:user_rate_product).permit(:user_id, :product_id, :rate_id)
            end
        end
    end
end
  