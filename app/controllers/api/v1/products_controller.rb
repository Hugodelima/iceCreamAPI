module Api
    module V1
      class ProductsController < ApplicationController
        before_action :set_product, only: %i[show update destroy]
  
        def index
          products = ProductsFilter.retrive_all
          render json: products, status: :ok
        end
  
        def show
          render json: @product, status: :ok
        end
        
        def filter_by_category
          category_id = params[:category_id]
          products = ProductsFilter.filter_by_category(Product.all, category_id)
        
          if products.exists?
            render json: products, status: :ok
          else
            render json: { error: 'No products found for this category' }, status: :not_found
          end
        end
        
  
        def create
          product = Product.new(product_params)
          if ProductsService.save(product)
            render json: product, status: :created
          else
            render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          if ProductsService.update(@product, product_params)
            render json: @product, status: :ok
          else
            render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          if ProductsService.destroy(@product)
            head :no_content
          else
            render json: { error: 'Failed to delete product' }, status: :unprocessable_entity
          end
        end
  
        private
  
        def set_product
          @product = Product.find_by(id: params[:id])
          render json: { error: 'Product not found' }, status: :not_found if @product.nil?
        end
  
        def product_params
          params.require(:product).permit(:title, :description, :brand, :value, :size, :quantity, :category_id, :image_url)
        end
      end
    end
  end
  