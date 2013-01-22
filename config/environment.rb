# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Machinery::Application.initialize!

def logged_in?
  not @current_user.nil?
end

def logged_as_admin?
  logged_in? and @current_user.admin?
end
