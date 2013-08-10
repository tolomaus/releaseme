class HomeController < ApplicationController
  def index
    @applications = {}
    return unless flash[:alert].nil?

    if user_signed_in?
      Integration.all.each do |integration|
        @applications[integration.provider_type] ||= Array.new
        service = ("Integrations::#{integration.provider_type}Provider").constantize.new(integration.url, integration.username, integration.password)
        @applications[integration.provider_type] += service.projects
      end
    end
  end
end
