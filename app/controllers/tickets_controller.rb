class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    respond_to do |format|
      format.json { render json: { tickets: @tickets }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @ticket = Ticket.find(params[:id])
        format.json { render json: { ticket: @ticket }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
   end

  def new
    @ticket = Ticket.new
    respond_to do |format|
      format.json { render json: { ticket: @ticket }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @ticket = Ticket.find(params[:id])
        format.json { render json: { ticket: @ticket }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      begin
        if @ticket.save
          format.json { render json: { ticket: @ticket }, status: :ok }
        else
          format.json { render json: { error: @ticket.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
          format.json { render json: { ticket: @ticket }, status: :ok }
        else
          format.json { render json: { error: @ticket.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @ticket = Ticket.find(params[:id])
        if @ticket.destroy
          format.json { render json: {}, status: :ok }
        else
          format.json { render json: { error: @ticket.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { ticket: @ticket }, status: :unprocessable_entity }
      end
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :showtime_id, :booking_id)
  end
end
