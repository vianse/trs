class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @proyectos = Proyecto.misproyectos(current_consultora.id)
    #@proyectos = Proyecto.all
    respond_with(@proyectos)
  end

  def show
    respond_with(@proyecto)
  end

  def new
    @clientes = Customer.by_clientes(current_consultora.id).pluck(:nombre)
    @proyecto = Proyecto.new
    respond_with(@proyecto)
  end

  def edit
    @clientes = Customer.by_clientes(current_consultora.id).pluck(:nombre)
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)
    @proyecto.save
    respond_with(@proyecto)
  end

  def update
    @proyecto.update(proyecto_params)
    respond_with(@proyecto)
  end

  def destroy
    @proyecto.destroy
    respond_with(@proyecto)
  end

  private
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    def proyecto_params
      params.require(:proyecto).permit(:cliente, :nombreProyecto, :lider, :gerente, :user_id)
    end
end
