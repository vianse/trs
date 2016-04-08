class DashboardController < ApplicationController
   respond_to :html
  def index
  	if consultora_signed_in?

    @con = Consultore.where(:user_id => current_consultora.id).count
    @cli = Customer.where(:user_id => current_consultora.id).count
    @pro = Proyecto.where(:user_id => current_consultora.id).count 	
  end
  if user_signed_in?
    @proyecto = Asignacione.where(:email => current_user.email).first

    redirect_to :controller => 'actividades' , :action => 'index', :proyecto => @proyecto.id

	end
  	#@profiles = Profile.all
    #respond_with(@profiles)
   
  end
end
