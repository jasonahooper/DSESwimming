class ApplicationController < ActionController::Base
  require "#{Rails.root}/lib/shared_helpers/process_csv_helper"
  include ProcessCSVHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
