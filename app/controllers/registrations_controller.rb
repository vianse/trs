class RegistrationsController < Devise::RegistrationsController
 skip_before_filter :verify_authenticity_token, :only => :create
  def new
    super
  end

  def create
  respond_to do |format|  
    format.html { 
      super 
    }
    format.json {
      build_resource
      if resource.save
         render :status => 200, :json => resource
      else
        render :json => resource.errors, :status => :unprocessable_entity
      end
    }
  end
 end

  def update
    super
  end
protected    

  def after_sign_up_path_for(resource)  
    destroy_user_session_path() 
  end 
   
end 