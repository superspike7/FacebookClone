class ProfilesController < ApplicationController


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

  def profile_param
    params.permit(@profile)
  end

end
