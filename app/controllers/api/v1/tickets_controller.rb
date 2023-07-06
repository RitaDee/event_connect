module Api
  module V1
    class TicketsController < ApplicationController
      before_action :set_ticket, only: %i[show update destroy]

      # GET /tickets
      def index
        @tickets = Ticket.all

        render json: @tickets
      end

      # GET /tickets/1
      def show
        render json: @ticket
      end

      # POST /tickets
      def create
        @ticket = Ticket.new(ticket_params)

        if @ticket.save
          render json: @ticket, status: :created
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tickets/1
      def update
        if @ticket.update(ticket_params)
          render json: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tickets/1
      def destroy
        @ticket.destroy
      end

      # GET /events/:id/tickets
      def event_tickets
        @event = Event.find(params[:id])
        @tickets = @event.tickets

        render json: @tickets
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def ticket_params
        params.require(:ticket).permit(:event_id, :user_id, :quantity, :price, :ticket_type, :images)
      end
    end
  end
end
