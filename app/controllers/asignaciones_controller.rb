class AsignacionesController < ApplicationController
  before_action :set_asignacione, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asignaciones = Asignacione.all
    respond_with(@asignaciones)
  end

  def show
    respond_with(@asignacione)
  end

  def new
    @asignacione = Asignacione.new
    respond_with(@asignacione)
  end

  def edit
  end

  def create
    @asignacione = Asignacione.new(asignacione_params)
    @asignacione.save
    respond_with(@asignacione)
  end

  def update
    @asignacione.update(asignacione_params)
    respond_with(@asignacione)
  end

  def destroy
    @asignacione.destroy
    #respond_with(@asignacione)
    redirect_to :controller => 'consultores', :action => 'index'
  end

  private
    def set_asignacione
      @asignacione = Asignacione.find(params[:id])
    end

    def asignacione_params
      params.require(:asignacione).permit(:id_consultora, :email, :cliente, :proyecto, :horaInicio, :horaFin)
    end
end
