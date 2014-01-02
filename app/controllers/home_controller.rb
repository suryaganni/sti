class HomeController < ApplicationController

  def index
    @courses = Course.order("name").page(params[:page]).per(5)
  end

end
