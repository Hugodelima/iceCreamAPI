module Api
	module V1
    	class CategoriesController < ApplicationController
            # fazer o serviço da controller
        	before action : set_category, only: %i[show,update,destroy]
        	def index
            	categories = CategoryFilter.retrive_all
            	render json: categories, status: :ok
        	end
            
        	def show
                render json: @category, status: :ok
            end

        	def create
                category = Category.new(category_params)
                if CategoryService.save(category)
                    render json: category, status:created
                else
                    render json: {errors: category.errors.full_message}, status: :unprocessable_entity
                end
	        end

        	def update
                CategoryService.update(category,category_params) ? true : false
            end

        	def destroy
                CategoryService.destroy(category)
                head :no_content
            end

        	private
        	def category_params
                    params
            .require(:category)
            .permit(:title, :description)
            end

        	def set_category
                @categories = CategoryFilter.find_by_id(params[:id])
            end
    	end
	end
end
