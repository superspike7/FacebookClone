class ProfilesController < ApplicationController
  before_action :profile_check, :except => [:new, :create]

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update  
  end

  private

  def profile_check
    redirect_to new_user_profile_path unless current_user.profile
  end

  def profile_param
    params.permit(@profile)
  end

end
