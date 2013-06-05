require 'yaml'

# ERB.new allows us to use ERB tags in the YAML
yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'settings.yml'))).result)

# Merge the "default" section with the section for this environment
config = yaml_data["default"]
begin
  config.merge! yaml_data[Rails.env]
rescue TypeError
# nothing specified for this environment; do nothing
end

# Pass to a HashWithIndifferentAccess so that we can use symbols (SETTINGS[:key])
SETTINGS = HashWithIndifferentAccess.new(config)