class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:edit, :update , :destroy]
  before_action :check_permitted_or_not , only: [:edit , :destroy]

  before_action :authenticate_user! , only: [:new , :create , :edit]
  

  before_action :check_permitted_manage_courses_or_not , only: [:new , :create, :edit , :destroy]


  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show     
    @lectures = Lecture.where(course_id: @course.id)
  end



  def check_permitted_manage_courses_or_not
      if current_user && current_user.usertype == 1
        redirect_to courses_path()
      end
  end




  # GET /courses/new
  def new
    @course = Course.new

  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create

    # authorize! :create, @course

    @course = Course.new(course_params)
    
    @course.user_id = current_user.id

    # puts "++++++++++++++++++++++++++++++++++++++++++++++++++++"

    # puts current_user.admin?

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_permitted_or_not
    if current_user
      if @course.try(:user).try(:id) != current_user.id
        redirect_to courses_path()
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title,:user_id)
      # params.require(:MODEL).permit(:title,:user_id)
    end
end
