# Provides Configurations!

require 'yaml'

class ConfigurationProvider
  def get
    config_file = File.read('~/.pairest.yml')
    YAML.load(config_file)
  end
end
