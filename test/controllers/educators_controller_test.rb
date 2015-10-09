require 'test_helper'

class EducatorsControllerTest < ActionController::TestCase
  setup do
    @educator = educators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create educator" do
    assert_difference('Educator.count') do
      post :create, educator: { dob: @educator.dob, ethnicity: @educator.ethnicity, first_name: @educator.first_name, gender: @educator.gender, job_title: @educator.job_title, last_name: @educator.last_name, ssn: @educator.ssn, summary: @educator.summary, title: @educator.title }
    end

    assert_redirected_to educator_path(assigns(:educator))
  end

  test "should show educator" do
    get :show, id: @educator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @educator
    assert_response :success
  end

  test "should update educator" do
    patch :update, id: @educator, educator: { dob: @educator.dob, ethnicity: @educator.ethnicity, first_name: @educator.first_name, gender: @educator.gender, job_title: @educator.job_title, last_name: @educator.last_name, ssn: @educator.ssn, summary: @educator.summary, title: @educator.title }
    assert_redirected_to educator_path(assigns(:educator))
  end

  test "should destroy educator" do
    assert_difference('Educator.count', -1) do
      delete :destroy, id: @educator
    end

    assert_redirected_to educators_path
  end
end
