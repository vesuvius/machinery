class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :init_defaults, :fetch_current_user, :session_expiry

  MAX_SESSION_PERIOD = 60.minutes
  
    
protected

  def init_defaults
    I18n.locale = params[:locale] if params[:locale].present?
    @kind_list = Kind.all.map { |kind| [kind.name, kind.id] }
    @country_list = Country.all.map { |country| [country.name, country.id] }
  end
  
  def default_url_options(options = {})
    { locale: I18n.locale }
  end
  
  def fetch_current_user
    return unless session[:user_id]
    @current_user = Person.find_by_id(session[:user_id])
  end

  def session_expiry
    if session[:expiry_time] and session[:expiry_time] < Time.now
      @current_user = nil
      session[:user_id] = nil
    end
    session[:expiry_time] = session[:session_time].blank? ? MAX_SESSION_PERIOD.seconds.from_now : session[:session_time].seconds.from_now
    return true
  end

  def login_required
    return true if logged_in?
    session[:return_to] = request.fullpath
    flash[:error] = (t 'unauthorized_access')
    redirect_to authenticate_path and return false
  end

  def admin_required
    return true if logged_as_admin?
    flash[:error] = (t 'admin_required')
    redirect_to authenticate_path and return false
  end

  def store_location
    session[:return_to] = request.get? ? request.fullpath : request.referer rescue nil
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
    
end
