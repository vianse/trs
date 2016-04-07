class InvitadosController < ApplicationController
  before_action :set_invitado, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @invitados = Invitado.all
    respond_with(@invitados)
  end

  def show
    respond_with(@invitado)
  end

  def new
    @invitado = Invitado.new
    respond_with(@invitado)
  end

  def edit
  end

  def create
    @invitado = Invitado.new(invitado_params)
    @invitado.save
    redirect_to :controller => 'consultores', :action => 'acceso'
    #respond_with(@invitado)
  end

  def update
    @invitado.update(invitado_params)
    respond_with(@invitado)
  end

  def destroy
    @invitado.destroy
    respond_with(@invitado)
  end

  private
    def set_invitado
      @invitado = Invitado.find(params[:id])
    end

    def invitado_params
      params.require(:invitado).permit(:id_consultora, :emailInvitado, :emailConsultor)
    end
end
