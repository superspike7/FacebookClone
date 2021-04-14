class RegistrationsController < Devise::RegistrationsController

   def create
    super
    UserMailer.welcome_email(resource).deliver unless resource.invalid?
  end

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
end