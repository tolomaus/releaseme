require 'teamcity'

module Integrations
  class TeamCityProvider
    def initialize(url, username, password)
      options=TeamCity.options
      options[:endpoint]=url + "/httpAuth/app/rest"
      options[:http_user]=username
      options[:http_password]=password

      @client = TeamCity::Client.new(options)
    end

    def projects
      @client.projects
    end
  end
end
