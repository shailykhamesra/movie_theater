class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    respond_to do |format|
      format.json { render json: { bookings: @bookings }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @booking = Booking.find(params[:id])
        format.json { render json: { booking: @booking }, status: :ok }
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def new
    @booking = Booking.new
    respond_to do |format|
      format.json { render json: { booking: @booking }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @booking = Booking.find(params[:id])
        format.json { render json: { booking: @booking }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity}
      end
    end
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      begin
        if @booking.save
          format.json { render json: { booking: @booking }, status: :ok }
        else
          format.json { render json: { error: @booking.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params)
          format.json { render json: { booking: @booking }, status: :ok }
        else
          format.json { render json: { error: @booking.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @booking = Booking.find(params[:id])
        if @booking.destroy
          format.json { render json: {}, status: :ok }
        else
          format.json { render json: { error: @booking.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { booking: @booking }, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :phone, :creditcard, :showtime_id)
  end
end
