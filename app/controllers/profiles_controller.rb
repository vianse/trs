class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_consultora!

  respond_to :html

  def index

    if consultora_signed_in? 
    @profiles = Profile.by_user(current_consultora.id)
    respond_with(@profiles)
    end
    if user_signed_in?
    @profiles = Profile.by_user(current_user.id)
    #@profiles = Profile.all
    respond_with(@profiles)
  end
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:nombre, :razonSocial, :direccion, :contacto, :email, :telOficina, :telMovil, :apellidos, :puesto, :logo, :foto, :type, :user_id)
    end
end
