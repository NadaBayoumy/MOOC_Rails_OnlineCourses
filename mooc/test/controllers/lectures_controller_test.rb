require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  setup do
    @lecture = lectures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lectures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lecture" do
    assert_difference('Lecture.count') do
      post :create, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id }
    end

    assert_redirected_to lecture_path(assigns(:lecture))
  end

  test "should show lecture" do
    get :show, id: @lecture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lecture
    assert_response :success
  end

  test "should update lecture" do
    patch :update, id: @lecture, lecture: { attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id }
    assert_redirected_to lecture_path(assigns(:lecture))
  end

  test "should destroy lecture" do
    assert_difference('Lecture.count', -1) do
      delete :destroy, id: @lecture
    end

    assert_redirected_to lectures_path
  end


  # Testing associations
  test "lecture should belong to course" do
    should belong_to :course
  end

  test "should have many likes" do
    should has_many :likes
  end

  # Other tests
  test "should create and redirect to show lecture" do
    lecture = lectures(:valid_lecture)
    get lecture_url(lecture)
    assert_response :success
  end


  test "comment object not nil as it is created on show action of lecture" do
    @lecture = lectures(:valid_lecture)
    get :show, id: @lecture
    assert_not_nil @comment
  end

  

end
