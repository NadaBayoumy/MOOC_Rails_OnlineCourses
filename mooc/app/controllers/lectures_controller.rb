class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :user_like_lecture, :user_dislike_lecture, :user_spam_lecture, :user_unspam_lecture]
  before_action :authenticate_user! , only: [:new , :create]

  before_action :check_permitted_manage_lectures_or_not , only: [:new , :create, :edit , :destroy]


  # before_action :download_file

  # GET /lectures
  # GET /lectures.json
  def index
    # @lectures = Lecture.all
    course_id_from_param = params[:course_id] 
    @lectures = Lecture.where(course_id: course_id_from_param)
    
  end



  def check_permitted_manage_lectures_or_not
      if current_user && current_user.usertype == 1
        redirect_to lectures_path()
      end
  end



  # GET /lectures/1
  # GET /lectures/1.json
  def show
    # @comments = Comment.all
    @comments = Comment.where(lecture_id: @lecture.id)
    if current_user
      @comment = Comment.new
      @comment.user_id = current_user.id
      @comment.lecture_id = @lecture.id
    end
  end


  # Stream a file that has already been generated and stored on disk.
  def download_file
    # lecture = Lecture.find(params[:id])
    send_file("#{Rails.root}/public/#{@lecture.attachment}",
              filename: "#{@lecture.attachment}")
  end




# ef download_pdf
#     client = Client.find(params[:id])
#     send_file("#{Rails.root}/files/clients/#{client.id}.pdf",
#               filename: "#{client.name}.pdf",
#               type: "application/pdf")
#   end



  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end


  #nada likes and dislikes
  def user_like_lecture
    if current_user
      likeobj = Like.new()
      likeobj.lecture_id = @lecture.id
      likeobj.user_id = current_user.id
      likeobj.save()
      redirect_to @lecture
    end
  end

  def user_dislike_lecture
    Like.where(:user_id => current_user.id).where(:lecture_id => @lecture.id).destroy_all
    redirect_to @lecture
  end
  #end nada likes and dislikes




  #nada spams  and un spams
  def user_spam_lecture
    if current_user
      spamobj = Spam.new()
      spamobj.lecture_id = @lecture.id
      spamobj.user_id = current_user.id
      spamobj.save()
      redirect_to @lecture
    end
  end

  def user_unspam_lecture
    if current_user
      Spam.where(:user_id => current_user.id).where(:lecture_id => @lecture.id).destroy_all
      redirect_to @lecture
    end
  end
  #end nada spams  and un spams


  

  #nada commets  and remove comments
  def user_comment_lecture
    if current_user
      commentobj = Comment.new()
      commentobj.lecture_id = @lecture.id
      commentobj.user_id = current_user.id
      commentobj.content = "static content"

      commentobj.save()
      redirect_to @lecture
    end
  end
  
  def user_remove_comment_lecture
    if current_user
      Comment.where(:user_id => current_user.id).where(:lecture_id => @lecture.id).destroy_all
      redirect_to @lecture
    end
  end
  #nada commets  and remove comments











  # POST /lectures
  # POST /lectures.json
  def create
    unless current_user

    end

    @lecture = Lecture.new(lecture_params)
    @lecture.user_id = current_user.id
    
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end



  # def download_file
  #   # @model = MyModel.find(params[:id])
  #   # send_file(@lecture.attachment.,
  #   #       :filename => @lecture.attachment,
  #   #       :type => @lecture.attachment.content_type,
  #   #       :disposition => 'attachment',
  #   #       :url_based_filename => true)

  #   # uploader = AvatarUploader.new

  #   # uploader.store!(my_file)

  #   # uploader.retrieve_from_store!(@lecture.attachment)
  # end




  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end
end
