require 'yaml'

class ConfigurationProvider
  def user_configurations
    yaml_users = load_yaml

    yaml_users.map do |initials, details|
      UserConfiguration.new initials: initials,
                            name: details['name'],
                            key: details['key_name'],
                            email: details['email']
    end
  end

  private

  def load_yaml
    config_file = File.read('~/.pairest.yml')
    YAML.load(config_file)
  end
end
