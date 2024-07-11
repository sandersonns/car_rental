# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   include Pundit::Authorization

#   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

#   after_action :verify_authorized, except: :index, unless: :skip_pundit?
#   after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

#   def policy_scope(scope, policy_scope_class: nil, context: {})
#     policy_scope_class ||= Pundit::PolicyFinder.new(scope).scope!
#     policy_scope_class.new(pundit_user, scope, context).resolve
#   end

#   private

#   def skip_pundit?
#     devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
#   end

#   def default_url_options
#     { host: ENV["DOMAIN"] || "localhost:3000" }
#   end

# end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

