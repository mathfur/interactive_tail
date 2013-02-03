class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_display_option
    @display_option = params[:display_option] || {}
  end
  before_filter :set_display_option
end
