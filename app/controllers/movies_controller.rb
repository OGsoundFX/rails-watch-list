class MoviesController < ApplicationController
  def index
    # raise unless request.referer == "http://localhost:3000/"
    # @movies = Movie.all
    @order = "default"
    if params[:order] == "alpha"
      if params[:type] == "default" || params[:type] == "title_desc"
        @movies = policy_scope(Movie).order(title: :asc)
        @order = "title_asc"
      else
        @movies = policy_scope(Movie).order(title: :desc)
        @order = "title_desc"
      end
    elsif params[:order] == "rating"
      if params[:type] == "default" || params[:type] == "rating_desc"
        @movies = policy_scope(Movie).order(rating: :asc)
        @order = "rating_asc"
      else
        @movies = policy_scope(Movie).order(rating: :desc)
        @order = "rating_desc"
      end
    elsif params[:order] == "pop"
      if params[:type] == "default" || params[:type] == "popularity_desc"
        @movies = policy_scope(Movie).order(popularity: :asc)
        @order = "popularity_asc"
      else
        @movies = policy_scope(Movie).order(popularity: :desc)
        @order = "popularity_desc"
      end
    elsif params[:order] == "date"
      if params[:type] == "default" || params[:type] == "date_desc"
        @movies = policy_scope(Movie).order(release_date: :asc)
        @order = "date_asc"
      else
        @movies = policy_scope(Movie).order(release_date: :desc)
        @order = "date_desc"
      end
    else
      @movies = policy_scope(Movie)
    end
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
