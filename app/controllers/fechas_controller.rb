class FechasController < ApplicationController
  before_action :set_fecha, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def import
    Fecha.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end



  def index
    @fechas = Fecha.all
    respond_with(@fechas)
  end

  def show
    respond_with(@fecha)
  end

  def new
    @fecha = Fecha.new
    respond_with(@fecha)
  end

  def edit
  end

  def create
    @fecha = Fecha.new(fecha_params)
    @fecha.save
    respond_with(@fecha)
  end

  def update
    @fecha.update(fecha_params)
    respond_with(@fecha)
  end

  def destroy
    @fecha.destroy
    respond_with(@fecha)
  end

  private
    def set_fecha
      @fecha = Fecha.find(params[:id])
    end

    def fecha_params
      params.require(:fecha).permit(:fecha, :mes, :dia, :diaL, :mesL, :año)
    end
end
