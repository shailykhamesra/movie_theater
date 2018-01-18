class TheatersController < ApplicationController
  def index
    @theaters = Theater.all
    respond_to do |format|
      format.json { render json: { theaters: @theaters }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @theater = Theater.find(params[:id])
        format.json { render json: { theater: @theater }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
   end

  def new
    @theater = Theater.new
    respond_to do |format|
      format.json { render json: { theater: @theater }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @theater = Theater.find(params[:id])
        format.json { render json: { theater: @theater }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def create
    @theater = Theater.new(theater_params)
    respond_to do |format|
      begin
        if @theater.save
          format.json { render json: { theater: @theater }, status: :ok }
        else
          format.json { render json: { error: @theater.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @theater = Theater.find(params[:id])
        if @theater.update(theater_params)
          format.json { render json: { theater: @theater }, status: :ok }
        else
          format.json { render json: { error: @theater.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @theater = Theater.find(params[:id])
        if @theater.destroy
          format.json { render json: {}, status: :ok }
        else
          format.json { render json: { error: @theater.errors }, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: { theater: @theater }, status: :unprocessable_entity }
      end
    end
  end

  private

  def theater_params
    params.require(:theater).permit(:name, :address)
  end
end
