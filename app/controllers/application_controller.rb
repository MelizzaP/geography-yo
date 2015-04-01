class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from ActionView::MissingTemplate do |exception|
    render json: "Your request needs to have a radius", status: 400
  end
end
