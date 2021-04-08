class ProfilesController < ApplicationController
  before_action :profile_check, :except => [:new, :create]

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path 
    else
      render :new
    end
  end

  def show
    @profile = current_user.profile 
  end

  def edit
  end

  def update  
  end

  private

  def profile_check
    redirect_to new_user_profile_path unless current_user.profile
  end

  def profile_params
    params.permit(:username, :age, :hobby, :status)
  end

end
