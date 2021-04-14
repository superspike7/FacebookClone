class RegistrationsController < Devise::RegistrationsController

   def create
    super
    UserMailer.with(resource).welcome_email.deliver_later unless resource.invalid?
  end

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
end