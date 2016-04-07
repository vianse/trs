require 'test_helper'

class ConsultoresControllerTest < ActionController::TestCase
  setup do
    @consultore = consultores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultore" do
    assert_difference('Consultore.count') do
      post :create, consultore: { cliente: @consultore.cliente, email: @consultore.email, nombre: @consultore.nombre, proyecto: @consultore.proyecto, user_id: @consultore.user_id }
    end

    assert_redirected_to consultore_path(assigns(:consultore))
  end

  test "should show consultore" do
    get :show, id: @consultore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultore
    assert_response :success
  end

  test "should update consultore" do
    patch :update, id: @consultore, consultore: { cliente: @consultore.cliente, email: @consultore.email, nombre: @consultore.nombre, proyecto: @consultore.proyecto, user_id: @consultore.user_id }
    assert_redirected_to consultore_path(assigns(:consultore))
  end

  test "should destroy consultore" do
    assert_difference('Consultore.count', -1) do
      delete :destroy, id: @consultore
    end

    assert_redirected_to consultores_path
  end
end
