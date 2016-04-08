class ActividadesController < ApplicationController
  before_action :set_actividade, only: [:show, :edit, :update, :destroy]

  respond_to :html , :json

 def abrir_periodo
  logger.debug params[:mes]
  @verificaPeriodo = Actividade.where(:mes => params[:mes], :ano =>  params[:año], :id_consultor => current_user.id, :id_consultora => params[:id_consultora]).first
   if @verificaPeriodo.nil?
    @fecha = Fecha.where(:mes =>  params[:mes] , :año =>  params[:año])
    
    @fecha.each do |fecha|
    @asignacion = Asignacione.ListadoPrincipal(params[:id_consultora],current_user.email).first
    @dia = fecha.fecha
    @actividade = Actividade.create({
    :diaActual => fecha.fecha, 
    :horaEntrada => @asignacion.horaInicio, 
    :horaSalida => @asignacion.horaFin, 
    :actividad => "Sin Actividad", 
    :diaLetra => fecha.diaL, 
    :horasTrabajadas => params[:horasTrabajadas], 
    :dias => 0, 
    :medioDia => nil, 
    :HorasExtra => nil, 
    :horaRemoto => nil,
    :id_consultora => params[:id_consultora] , 
    :id_consultor => params[:id_consultor], 
    :mes => params[:mes] , 
    :ano => params[:año]

    });

    @actividade.save
   
    end
      redirect_to :action => 'index', :proyecto => params[:id_consultora]
   else
      flash[:notice] = "Periodo ya existente"
      redirect_to :action => 'index', :proyecto => params[:id_consultora]
    end 
 end

  def index

    @fecha = Fecha.where(:mes => Date.current.strftime("%m") , :año => Date.current.strftime("%Y"))
    #logger.debug @fecha[0].to_s
    @dias = Actividade.where(:mes => Date.current.strftime("%m") , :ano => Date.current.strftime("%Y"), :id_consultor => current_user.id,:id_consultora => params[:proyecto], :dias => "1").count
    @conteo = Actividade.where(:mes => Date.current.strftime("%m") , :ano => Date.current.strftime("%Y"), :id_consultor => current_user.id,:id_consultora => params[:proyecto]).count
    @periodos = Fecha.select(:mesl).map(&:mesl).uniq
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @id_consultora = Consultore.find_by(:email => current_user.email)
    @consultora= Profile.find_by(:user_id => @id_consultora.user_id)
    @consultores = Consultore.where(:user_id => @id_consultora.user_id).count
    @actividade = Actividade.new
    #@asignacion = Asignacione.find_by(:email => current_user.email)
    @asignacion = Asignacione.ListadoPrincipal(params[:proyecto],current_user.email).first
    @email= Consultore.find_by(:email => current_user.email)
    @asignaciones = Asignacione.misasignaciones(@email.email).all
    #@actividades = Actividade.all
    @actividades = Actividade.where(:mes => Date.current.strftime("%m") , :ano => Date.current.strftime("%Y"), :id_consultor => current_user.id,:id_consultora => params[:proyecto])
    #@actividades = Actividade.ListadoPrincipal(:id_consultora, current_user.id)
    
    respond_with(@actividades)
  end

  def show
    respond_with(@actividade)
  end

  def new
    @actividade = Actividade.new
    respond_with(@actividade)
  end

  def edit
  end

  def create
  
    @actividade = Actividade.new(actividade_params)
    @actividade.save
    #respond_with(@actividade)
    redirect_to :action => 'index', :proyecto => actividade_params[:id_consultora]
  end

  def update

        @actividade.update(actividade_params)
        respond_with(@actividade)
   
  end

  def destroy
    @actividade.destroy
    respond_with(@actividade)
  end

  private
    def set_actividade
      @actividade = Actividade.find(params[:id])
    end

    def actividade_params
      params.require(:actividade).permit(:diaActual, :horaEntrada, :horaSalida, :actividad, :diaLetra, :horasTrabajadas, :dias, :medioDia, :HorasExtra, :horaRemoto,:id_consultora, :id_consultor, :mes, :ano)
    end
end
