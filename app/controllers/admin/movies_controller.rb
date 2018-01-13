class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_movie, only: [:show, :edit, :update, :destroy]


  def index
    @movies = Movie.page(params[:page]).per(15)
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
    #將原本程式碼移到 private 下，命名為 set_movie
  end

  def edit
    #將原本程式碼移到 private 下，命名為 set_movie
  end

  def update
    if @movie.update(movie_params)
      flash[notice] = "Moive was Successfully Updated"
      redirect_to admin_movie_path(@movie)
    else
      flash.now[:alert] = "Move was Failed to Updated"
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to admin_movies_path
    flash[:alert] = "Movie was Deleted"
  end


  private

  def movie_params
    params.require(:movie).permit(:name, :year, :score, :description, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
