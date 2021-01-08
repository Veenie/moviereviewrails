class MoviesController < ApplicationController
  def show
    @movie = Movie.find_by_id(params[:id])
    redirect_to '/movies' if !@movie
  end
  
  def index
    @movies = Movie.alpha
  end

  def latest
    redirect_to movie_path(Movie.latest)
  end  


end
