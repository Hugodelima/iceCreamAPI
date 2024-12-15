module Api
  module V1
    class UsersController < ApplicationController
      # Set the user before show, update, or destroy actions
      before_action :set_user, only: %i[show update destroy]

      def index
        users = UsersFilter.retrieve_all
        render json: users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        user = User.new(user_params)
        if UsersService.save(user)
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if UsersService.update(@user, user_params)
          render json: @user, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        UsersService.destroy(@user)
        head :no_content
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
        render json: { error: 'User not found' }, status: :not_found if @user.nil?
      end

      def user_params
        params.require(:user).permit(:name, :gender, :email, :password, :password_confirmation, :role, :address_id)
      end           
    end
  end
end
