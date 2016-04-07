require 'test_helper'

class ActividadesControllerTest < ActionController::TestCase
  setup do
    @actividade = actividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actividade" do
    assert_difference('Actividade.count') do
      post :create, actividade: { HorasExtra: @actividade.HorasExtra, actividad: @actividade.actividad, diaActual: @actividade.diaActual, diaLetra: @actividade.diaLetra, dias: @actividade.dias, horaEntrada: @actividade.horaEntrada, horaRemoto: @actividade.horaRemoto, horaSalida: @actividade.horaSalida, horasTrabajadas: @actividade.horasTrabajadas, medioDia: @actividade.medioDia }
    end

    assert_redirected_to actividade_path(assigns(:actividade))
  end

  test "should show actividade" do
    get :show, id: @actividade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actividade
    assert_response :success
  end

  test "should update actividade" do
    patch :update, id: @actividade, actividade: { HorasExtra: @actividade.HorasExtra, actividad: @actividade.actividad, diaActual: @actividade.diaActual, diaLetra: @actividade.diaLetra, dias: @actividade.dias, horaEntrada: @actividade.horaEntrada, horaRemoto: @actividade.horaRemoto, horaSalida: @actividade.horaSalida, horasTrabajadas: @actividade.horasTrabajadas, medioDia: @actividade.medioDia }
    assert_redirected_to actividade_path(assigns(:actividade))
  end

  test "should destroy actividade" do
    assert_difference('Actividade.count', -1) do
      delete :destroy, id: @actividade
    end

    assert_redirected_to actividades_path
  end
end
