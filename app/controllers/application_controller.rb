class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    # redirect_back(fallback_location: root_path)
    redirect_to '/'
  end

  # def user_not_authorized
  #   render_404 # or any other method to render your 404 page
  # end

  # def render_404
  #   render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  # end

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || not_found_path)
  # end

  # def not_found_path
  #   raise ActionController::RoutingError.new('Not Found')
  # end

  # def not_found
  #   render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  # end
end
