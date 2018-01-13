class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie was sucessfully created"
      redirect_to admin_movies_path
    else
      flash.now[:alert] = "Movie was failed to create"
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end


  private

  def movie_params
    params.require(:movie).permit(:name, :year, :score, :description )
  end

end
