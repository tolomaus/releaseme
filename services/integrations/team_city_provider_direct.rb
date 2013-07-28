require 'rest-client'

module Integrations
  class TeamCityProvider
    attr_reader :url, :username, :password

    def initialize(url, username, password)
      @url, @username, @password = url, username, password
    end

    def get_applications
      get("httpAuth/app/rest/projects")
    end

    private

    def get(path)
      url = @url + path
      #begin
        Rails.logger.info "HTTP GET #{url}"

        resource=RestClient::Resource.new(
            URI.encode(url),
            :user => @username,
            :password => @password,
            # :ssl_ca_file      =>  "/soft/releaseme/home/certs/CAGroup.pem",
            # :verify_ssl       =>  OpenSSL::SSL::VERIFY_PEER
        )

        response = resource.get :accept => :json

        if response.code >= 300
          raise AppException("REST call returned HTTP code #{response.code} (#{response})")
        else
          Rails.logger.info "return code: #{response.code}"
          parsed_response = JSON.parse(response)

          Rails.logger.debug "Response:"
          Rails.logger.debug parsed_response.inspect
          parsed_response
        end
      #rescue RestClient::Exception => re
      #  result["status"] = "error"
      #  result["error_code"]= re.response.code
      #  result["error_message"] = "REST call generated a RestClient error:\n#{re.response.code}\n#{re.response}"
      #  write_to "REST call generated a RestClient error #{re.response.code}" # Don't log this message as an error because in case of a 404 there is a workaround in some cases
      #end
    end

  end
end
