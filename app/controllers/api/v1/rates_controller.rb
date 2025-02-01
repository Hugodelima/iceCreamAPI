module Api
  module V1
    class RatesController < ApplicationController
      before_action :set_rate, only: %i[show update destroy]

      # GET /rates
      def index
        rates = RateFilter.retrieve_all
        render json: rates, status: :ok
      end

      # GET /rates/:id
      def show
        render json: @rate, status: :ok
      end

      # POST /rates
      def create
        rate = Rate.new(rate_params)

        if RateService.save(rate)
          render json: rate, status: :created
        else
          render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /rates/:id
      def update
        if RateService.update(@rate, rate_params)
          render json: @rate, status: :ok
        else
          render json: { errors: @rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /rates/:id
      def destroy
        if RateService.destroy(@rate)
          head :no_content
        else
          render json: { error: 'Failed to delete rate' }, status: :unprocessable_entity
        end
      end

      private

      def set_rate
        @rate = Rate.find_by(id: params[:id])
        render json: { error: 'Rate not found' }, status: :not_found if @rate.nil?
      end

      def rate_params
        params.require(:rate).permit(:star, :comment, :product_id, :user_id)
      end
    end
  end
end
