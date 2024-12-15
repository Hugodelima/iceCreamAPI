module Api
    module V1
      class RatesController < ApplicationController
        # Set the rate before show, update, or destroy actions
        before_action :set_rate, only: %i[show update destroy]
  
        def index
          rates = RateFilter.retrive_all
          render json: rates, status: :ok
        end
  
        def show
          render json: @rate, status: :ok
        end
  
        def create
          rate = Rate.new(rate_params)
          if RateService.save(rate)
            render json: rate, status: :created
          else
            render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          if RateService.update(@rate, rate_params)
            render json: @rate, status: :ok
          else
            render json: { errors: @rate.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          RateService.destroy(@rate)
          head :no_content
        end
  
        private
  
        def rate_params
          params.require(:rate).permit(:star, :comment)
        end
  
        def set_rate
          @rate = Rate.find_by(id: params[:id])
          render json: { error: 'Rate not found' }, status: :not_found if @rate.nil?
        end
      end
    end
  end
  