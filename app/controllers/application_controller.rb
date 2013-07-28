class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    logger.error("Access denied #{exception} - action: #{exception.action} - subject: #{exception.subject}")

    respond_to do |format|
      format.html { redirect_to root_path, :alert => exception.message }
      format.json { render json: exception.to_json, status: :forbidden }
      format.xml { render xml: exception.to_xml, status: :forbidden }
    end
  end

  rescue_from StandardError do |exception|
    logger.error("#{exception}")

    respond_to do |format|
      format.html { Rails.env.development? ? (raise exception) : (redirect_to root_path, :alert => exception.message) }
      format.json { render json: exception.to_json, status: 500 }
      format.xml { render xml: exception.to_xml, status: 500 }
    end
  end
end
