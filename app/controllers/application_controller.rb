class ApplicationController < ActionController::Base
  include ApplicationHelper
  layout :layout

  private

  def layout
    devise_controller? && devise_mapping.name == :admin ? "admin" : "application"
  end
end
