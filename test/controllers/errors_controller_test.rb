require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get sub_layout" do
    get :sub_layout
    assert_response :success
  end

  test "should get erro_404" do
    get :erro_404
    assert_response :success
  end

  test "should get error_422" do
    get :error_422
    assert_response :success
  end

  test "should get error_500" do
    get :error_500
    assert_response :success
  end

  test "should get error_505" do
    get :error_505
    assert_response :success
  end

end
