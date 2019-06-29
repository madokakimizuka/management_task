class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_required

  private

  def login_required
    redirect_to new_user_path unless current_user
  end
end
