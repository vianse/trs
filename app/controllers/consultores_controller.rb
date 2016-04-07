class ConsultoresController < ApplicationController
  before_action :set_consultore, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :html, :json
  def enviar_email
    @user = params[:correo]
    @consultora = Profile.find_by(:user_id => current_consultora.id)
    Mailer.invitacion(@user,@consultora).deliver
    redirect_to :controller => 'consultores', :action => 'acceso'
  end

  def acceso
    @invitado = Invitado.new
    @invitados = Invitado.where(:id_consultora => current_consultora.id)
    if params[:correo].nil?
       @mensaje = ""
    else  
    @verificaU = User.existe(params[:correo]).count

      if @verificaU == 1 
       @leyenda = "U"
       @mensaje ="El correo " + params[:correo] + " ya existe, desea darle acceso a uno de sus consultores?"
        # Mailer.invitacion(@user).deliver
          else  
            @verificaC = Consultora.existe(params[:correo]).count
          if @verificaC == 1
            @leyenda = "C"
          elsif @verificaC == 0 
            @leyenda = "N"
            @mensaje = "El usuario aun no se encuentra registrado, desea enviarle una invitación para que se registre?"
          end  

      end  
     end 
    @email = params[:correo]
    @users = User.all
    @consultores = Consultore.misconsultores(current_consultora.id).pluck(:email)
  end
 def register_invitados
    #@users = User.find_by(:email => params[:email])

    @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :invitado => params[:invitado], :email_consultor => params[:email_consultor].to_s, :email_consultora => params[:email_consultora])
   # @user.save
     respond_to do |format|
      if @user.save
        format.html { redirect_to consultores_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  def index
    #@conteo = Consultore.count('id', :distinct => true)
 
    @consultores = Consultore.misconsultores(current_consultora.id)
    respond_with(@consultores)

  end

  def register
     @consultore = Consultore.find(params[:id])
     @resource ||= User.new
  end

  def register_user
    @consultore = Consultore.find_by(:email => params[:email])
    @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
   # @user.save
     respond_to do |format|
      if @user.save
         @consultore.update(:access => true)
        format.html { redirect_to consultores_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
     @consultores = Consultore.all
  end
    
  def asignar
     @consultore = Consultore.find(params[:id])
     @clientes = Customer.by_clientes(current_consultora.id).pluck(:nombre)
    @proyectos = Proyecto.misproyectos(current_consultora.id).pluck(:nombreProyecto)
  end
    def crear_asignaciones

    @consultore = Consultore.find_by(:email => params[:email])
    @asignacion = Asignacione.new(:id_consultora => params[:id_consultora], :email => params[:email], :cliente => params[:cliente], :proyecto => params[:proyecto], :horaInicio => params[:horaInicio],:horaFin => params[:horaFin])
   # @user.save
     respond_to do |format|
      if @asignacion.save
        # @consultore.update(:access => true)
        format.html { redirect_to consultores_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show
    respond_with(@consultore)
  end

  def new
    @asignaciones = Asignacione.all
    @asignacione = Asignacione.all
    @customers = Customer.list_clientes(current_consultora.id)
    @clientes = Customer.by_clientes(current_consultora.id).pluck(:nombre)
    @proyectos = Proyecto.misproyectos(current_consultora.id).pluck(:nombreProyecto)
    @consultore = Consultore.new
    respond_with(@consultore)
  end

  def edit
    @consultore = Consultore.find(params[:id])
    @email= Consultore.find(params[:id])
    @asignaciones = Asignacione.misasignaciones(@email.email)
  end

  def create
    @consultore = Consultore.new(consultore_params)
    @consultore.save
    respond_with(@consultore)
  end

  def update
    @consultore.update(consultore_params)
    respond_with(@consultore)
  end

  def destroy
    @consultore.destroy
    respond_with(@consultore)
  end



  private
    def set_consultore
      @consultore = Consultore.find(params[:id])
    end

    def consultore_params
      params.require(:consultore).permit(:nombre, :email, :cliente, :proyecto, :user_id, :access)
    end
end
