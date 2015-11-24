require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get aboutMe" do
    get :aboutMe
    assert_response :success
  end

  test "should get fileArchive" do
    get :fileArchive
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

end
