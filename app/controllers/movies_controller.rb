class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    @movies = policy_scope(Movie)
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def new
    @movie = Movie.new
    authorize @movie
  end

  def create
    new_movie = Movie.new(movies_params)
    authorize new_movie
    if new_movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def movies_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
