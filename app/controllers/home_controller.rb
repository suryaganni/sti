class HomeController < ApplicationController

  def index
    @courses = []
    if params[:category].present? && params[:category][:ids].present?
      category_ids = params[:category][:ids].compact.map(&:to_i)
      Course.all.each do |c|
        if category_ids.any? {|cat_id| c.category_ids.include?(cat_id) }
          @courses << c
        end
      end
      @courses = Kaminari.paginate_array(@courses).page(params[:page]).per(5)
    else
      @courses = Course.order("name").page(params[:page]).per(5)
    end
  end
  
  def about_us
  end
  
  def contact_us
  end

end
