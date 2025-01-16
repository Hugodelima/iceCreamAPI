module Api
    module V1
      class AddressesController < ApplicationController
       
        before_action :set_address, only: %i[show update destroy]

        def index
          addresses = AddressFilter.retrive_all
          render json: addresses, status: :ok
        end

        def show
          render json: @address, status: :ok
        end

        def create
          address = Address.new(address_params)
          if AddressesService.save(address)
            render json: address, status: :created
          else
            render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
          end
        end
  

        def update
          if AddressesService.update(@address, address_params)
            render json: @address, status: :ok
          else
            render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          AddressesService.destroy(@address)
          head :no_content
        end
  
        private
  

        def address_params
          params.require(:address).permit(:street, :number, :neighborhood, :city, :zip_code)
        end        

        def set_address
          @address = Address.find_by(id: params[:id])
          render json: { error: 'Address not found' }, status: :not_found if @address.nil?
        end
      end
    end
  end
  