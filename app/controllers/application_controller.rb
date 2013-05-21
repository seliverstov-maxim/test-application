class ApplicationController < ActionController::Base
  include AuthHelper
  protect_from_forgery

  helper_method :current_user, :signed_in?

  before_filter :authenticate_user!
end
