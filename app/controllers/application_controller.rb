class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  # Rescue unauthorized actions
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    action = exception.query.to_s.remove("?")

    flash[:alert] = case action
                    when "update"
                      "You cannot edit this record."
                    when "destroy"
                      "You cannot delete this record."
                    when "create"
                      "You are not allowed to create this resource."
                    else
                      "You are not authorized to perform this action."
                    end

    redirect_to(request.referrer || root_path)
  end   
end