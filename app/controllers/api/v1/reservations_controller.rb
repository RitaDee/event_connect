module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_reservation, only: %i[show update destroy]

      # GET /reservations
      def index
        @reservations = Reservation.includes(ticket: :event).all

        render json: @reservations.to_json(include: { ticket: { include: :event } })
      end

      # GET /reservations/1
      def show
        render json: @reservation, include: { ticket: { include: :event } }
      end

      # POST /reservations
      # def create
      #   @reservation = Reservation.new(reservation_params)

      #   if @reservation.save
      #     render json: @reservation, status: :created, location: @reservation
      #   else
      #     render json: @reservation.errors, status: :unprocessable_entity
      #   end
      # end

      # POST /reservations
      def create
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
          render json: @reservation, status: :created, location: api_v1_reservation_url(@reservation)
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /reservations/1
      def update
        if @reservation.update(reservation_params)
          render json: @reservation
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /reservations/1
      def destroy
        @reservation.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def reservation_params
        params.require(:reservation).permit(:ticket_id, :user_id)
      end
    end
  end
end
