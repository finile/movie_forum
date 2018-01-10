class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @movies = Movie.all
  end

end
