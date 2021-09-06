module Api
  module V1
    class LivesController < ApplicationController
      before_action :set_live, only: [:show, :update, :destroy]

      def index
        lives = Live.all
        render json: { status: "SUCCESS", data: lives }
      end

      def show
        render json: { status: "SUCCESS", message: "Loaded the live", data: @live }
      end

      def create
        live = Live.new(live_params)
        if live.save
          render json: { status: "SUCCESS", data: live }
        else
          render json: { status: "ERROR", data: live.errors }
        end
      end

      def destroy
        @live.destroy
        render json: { status: "SUCCESS", message: "Deleted the live", data: @live }
      end

      def update
        if @live.update(live_params)
          render json: { status: "SUCCESS", message: "Updated the live", data: @live }
        else
          render json: { status: "SUCCESS", message: "Not updated", data: @live.errors }
        end
      end

      private

      def set_live
        @live = Live.find(params[:id])
      end

      def live_params
        params.require(:live).permit(:title)
      end
    end
  end
end
