class ScreensController < ApplicationController
  def index
    @screens = Screen.all
    respond_to do |format|
      format.json { render json: { screens: @screens }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @screen = Screen.find(params[:id])
        format.json { render json: { screen: @screen }, status: :ok }
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def new
    @screen = Screen.new
    respond_to do |format|
      format.json { render json: { screen: @screen }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @screen = Screen.find(params[:id])
        format.json { render json: { screen: @screen }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def create
    @screen = Screen.new(screen_params)
    respond_to do |format|
      begin
         if @screen.save
           format.json { render json: { screen: @screen }, status: :ok }
         else
           format.json { render json: { error: @screen.errors }, status: :unprocessable_entity }
        end
      rescue => e
         format.json { render json: { error: e.message }, status: :unprocessable_entity }
       end
    end
  end

  def update
    respond_to do |format|
      begin
        @screen = Screen.find(params[:id])
         if @screen.update(screen_params)
           format.json { render json: { screen: @screen }, status: :ok }
         else
           format.json { render json: { screen: @screen.errors }, status: :unprocessable_entity }
         end
       rescue => e
         format.json { render json: { error: e.message }, status: :unprocessable_entity }
       end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @screen = Screen.find(params[:id])
        if @screen.destroy
          format.json { render json: { mesage: 'Deleted!' }, status: :ok }
        else
          format.json { render json: { screen: @screen.errors }, status: :unprocessable_entity }
       end
      rescue => e
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
      end
    end
  end

  private

  def screen_params
    params.require(:screen).permit(:number, :theater_id, :movie_id)
  end
end
