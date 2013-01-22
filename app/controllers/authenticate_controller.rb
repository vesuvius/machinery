class AuthenticateController < ApplicationController
  
  def authenticate
  end

  def login
    email = params[:email]
    password = params[:password]
    if email.blank? or password.blank? or Person.authenticate(email, password).nil?
      session[:user_id] = nil
			flash[:error] = (t 'login_incorrect')
			redirect_to authenticate_path
    else
      @current_user = Person.authenticate(email, password)
      session[:user_id] = @current_user.id
      session[:expire_time] = MAX_SESSION_PERIOD.seconds.from_now
      session[:session_time] = MAX_SESSION_PERIOD
      flash[:notice] = (t 'login_correct')
      redirect_back_or_default(root_path)
    end
  end

  def logout
    @current_user = nil
    session[:user_id] = nil
    reset_session
    redirect_back_or_default(root_path)
  end

end
