class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_my_tour?
  before_action :set_locale
  include SessionsHelper

  
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end
  
# Get locale from top-level domain or return nil if such locale is not available
# You have to put something like:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# in your /etc/hosts file to try this out locally
def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
end

def current_user
  return @current_user if @current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

def is_my_tour?(tour)  
  if current_user 
    tour.created_by?(current_user.id) 
  end
end

  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
