module Api
  
    module V1
      class CategoriesController < ApplicationController
        before_action :set_category, only: %i[show update destroy]
  
        def index
          categories = CategoryFilter.retrive_all
          render json: categories, status: :ok
        end
  
        def show
          render json: @category, status: :ok
        end
  
        def create
          category = Category.new(category_params)
          if CategoriesService.save(category)
            render json: category, status: :created
          else
            render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          if CategoriesService.update(@category, category_params)
            render json: @category, status: :ok
          else
            render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          CategoriesService.destroy(@category)
          head :no_content
        end
  
        private
  
        def category_params
          params.require(:category).permit(:title, :description)
        end
  
        def set_category
          @category = Category.find_by(id: params[:id])
          render json: { error: 'Category not found' }, status: :not_found if @category.nil?
        end
      end
    end
  end
  