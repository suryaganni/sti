class InstitutesController < BaseController
  before_action :set_institute, only: [:show, :edit, :update, :destroy]
  before_action :set_categories_group, only: [:edit, :add_new_course, :new, :update]
  before_action :set_courses, only: [:edit, :update]

  # GET /institutes
  # GET /institutes.json
  def index
    @institutes = Institute.where(:user_id => current_user.id)
    @institutes = Kaminari.paginate_array(@institutes).page(params[:page]).per(5)
  end

  # GET /institutes/1
  # GET /institutes/1.json
  def show
  end

  # GET /institutes/new
  def new
    @institute = Institute.new
  end
  
  def add_new_course
    @institute = Institute.find(params[:id])
    @course = Course.new
  end

  # GET /institutes/1/edit
  def edit
    @institute = Institute.find(params[:id])
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(institute_params)

    respond_to do |format|
      if @institute.save
        format.html { redirect_to "/institutes/#{@institute.id}/edit", notice: 'Institute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @institute }
      else
        format.html { render action: 'new' }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutes/1
  # PATCH/PUT /institutes/1.json
  def update
    respond_to do |format|
      if @institute.update(institute_params)
        format.html { redirect_to "/institutes/#{@institute.id}/edit", notice: 'Institute was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    @institute.destroy
    respond_to do |format|
      format.html { redirect_to institutes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institute
      @institute = Institute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institute_params
      params.require(:institute).permit(:name, :user_id, :id, courses_attributes: [:id, :name, :institute_id, :price, :_destroy, categories_combinations_attributes: [:id, :category_id, :start_date, :end_date, :start_time, :end_time, :duration, :_destroy]])
    end
    
    def set_categories_group
      @categories_group = Category.categories_group
    end
    
    def set_courses
      @courses = Kaminari.paginate_array(@institute.courses).page(params[:page]).per(5)
    end

end
