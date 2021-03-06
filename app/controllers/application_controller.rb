class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { flash[:error] = exception.message; redirect_to main_app.root_url }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
