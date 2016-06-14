require 'test_helper'

class EmptyingsControllerTest < ActionController::TestCase
  setup do
    @emptying = emptyings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emptyings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emptying" do
    assert_difference('Emptying.count') do
      post :create, emptying: { user_id: @emptying.user_id }
    end

    assert_redirected_to emptying_path(assigns(:emptying))
  end

  test "should show emptying" do
    get :show, id: @emptying
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emptying
    assert_response :success
  end

  test "should update emptying" do
    patch :update, id: @emptying, emptying: { user_id: @emptying.user_id }
    assert_redirected_to emptying_path(assigns(:emptying))
  end

  test "should destroy emptying" do
    assert_difference('Emptying.count', -1) do
      delete :destroy, id: @emptying
    end

    assert_redirected_to emptyings_path
  end
end
