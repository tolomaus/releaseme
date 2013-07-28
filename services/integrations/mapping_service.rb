module Integrations
  class MappingService
    def initialize(provider_type, url, username, password)
      @provider = ("Integrations::#{provider_type}Provider").constantize.new(url, username, password)
    end

    def propose_mappings
      project_hierarchy = build_project_hierarchy
      mappings = {}
    end

    def build_project_hierarchy

    end
  end
end