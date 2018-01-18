class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.all
    respond_to do |format|
      format.json { render json: { showtimes: @showtimes }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @showtime = Showtime.find(params[:id])
        format.json { render json: { showtime: @showtime }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def new
    @showtime = Showtime.new
    respond_to do |format|
      format.json { render json: { showtime: @showtime }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @showtime = Showtime.find(params[:id])
        format.json { render json: { showtime: @showtime }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def create
    respond_to do |format|
      begin
        @showtime = Showtime.new(showtime_params)
        if @showtime.save
          format.json { render json: { showtime: @showtime }, status: :ok }
        else
          format.json { render json: { showtime: @showtime }, status: :unprocessable_entity }
       end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @showtime = Showtime.find(params[:id])
        if @showtime.update(showtime_params)
          format.json { render json: { showtime: @showtime }, status: :ok }
        else
          format.json { render json: { showtime: @showtime.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @showtime = Showtime.find(params[:id])
        if @showtime.destroy
          format.json { render json: { mesage: 'Deleted!' }, status: :ok }
        else
          format.json { render json: { showtime: @showtime.errors }, status: :unprocessable_entity }
       end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def showtime_params
    params.require(:showtime).permit(:timings, :movie_id, :screen_id)
  end
end
