class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    respond_to do |format|
      format.json { render json: { movies: @movies }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      begin
        @movie = Movie.find(params[:id])
        format.json { render json: { movie: @movie }, status: :ok }
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def new
    @movie = Movie.new
    respond_to do |format|
      format.json { render json: { movie: @movie }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      begin
        @movie = Movie.find(params[:id])
        format.json { render json: { movie: @movie }, status: :ok }
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      begin
        if @movie.save
          format.json { render json: { movie: @movie }, status: :ok }
        else
          format.json { render json: { error: @movie.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
          format.json { render json: { movie: @movie }, status: :ok }
        else
          format.json { render json: { error: @movie.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @movie = Movie.find(params[:id])
        if @movie.destroy
          format.json { render json: {}, status: :ok }
        else
          format.json { render json: { error: @movie.errors }, status: :unprocessable_entity }
        end
      rescue StandardError => e
        format.json { render json: { movie: @movie }, status: :unprocessable_entity }
      end
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name)
  end
end
