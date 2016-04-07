require 'test_helper'

class AsignacionesControllerTest < ActionController::TestCase
  setup do
    @asignacione = asignaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asignaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asignacione" do
    assert_difference('Asignacione.count') do
      post :create, asignacione: { cliente: @asignacione.cliente, email: @asignacione.email, horaFin: @asignacione.horaFin, horaInicio: @asignacione.horaInicio, id_consultora: @asignacione.id_consultora, proyecto: @asignacione.proyecto }
    end

    assert_redirected_to asignacione_path(assigns(:asignacione))
  end

  test "should show asignacione" do
    get :show, id: @asignacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asignacione
    assert_response :success
  end

  test "should update asignacione" do
    patch :update, id: @asignacione, asignacione: { cliente: @asignacione.cliente, email: @asignacione.email, horaFin: @asignacione.horaFin, horaInicio: @asignacione.horaInicio, id_consultora: @asignacione.id_consultora, proyecto: @asignacione.proyecto }
    assert_redirected_to asignacione_path(assigns(:asignacione))
  end

  test "should destroy asignacione" do
    assert_difference('Asignacione.count', -1) do
      delete :destroy, id: @asignacione
    end

    assert_redirected_to asignaciones_path
  end
end
