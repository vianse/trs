require 'test_helper'

class InvitadosControllerTest < ActionController::TestCase
  setup do
    @invitado = invitados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitado" do
    assert_difference('Invitado.count') do
      post :create, invitado: { emailConsultor: @invitado.emailConsultor, emailInvitado: @invitado.emailInvitado, id_consultora: @invitado.id_consultora }
    end

    assert_redirected_to invitado_path(assigns(:invitado))
  end

  test "should show invitado" do
    get :show, id: @invitado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invitado
    assert_response :success
  end

  test "should update invitado" do
    patch :update, id: @invitado, invitado: { emailConsultor: @invitado.emailConsultor, emailInvitado: @invitado.emailInvitado, id_consultora: @invitado.id_consultora }
    assert_redirected_to invitado_path(assigns(:invitado))
  end

  test "should destroy invitado" do
    assert_difference('Invitado.count', -1) do
      delete :destroy, id: @invitado
    end

    assert_redirected_to invitados_path
  end
end
