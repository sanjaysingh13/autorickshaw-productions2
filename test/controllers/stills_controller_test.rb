require 'test_helper'

class StillsControllerTest < ActionController::TestCase
  setup do
    @still = stills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create still" do
    assert_difference('Still.count') do
      post :create, still: { film_id: @still.film_id, image: @still.image }
    end

    assert_redirected_to still_path(assigns(:still))
  end

  test "should show still" do
    get :show, id: @still
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @still
    assert_response :success
  end

  test "should update still" do
    patch :update, id: @still, still: { film_id: @still.film_id, image: @still.image }
    assert_redirected_to still_path(assigns(:still))
  end

  test "should destroy still" do
    assert_difference('Still.count', -1) do
      delete :destroy, id: @still
    end

    assert_redirected_to stills_path
  end
end
