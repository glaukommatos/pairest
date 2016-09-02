require 'yaml'

class ConfigurationProvider
  def self.user_configurations
    yaml_users = load_yaml

    yaml_users.map do |initials, details|
      UserConfiguration.new initials: initials,
                            name: details['name'],
                            key: details['key_name'],
                            email: details['email']
    end
  end

  private_class_method

  def self.load_yaml
    full_config_path = File.expand_path('~/.pairest.yml')

    if File.exist? full_config_path
      config_file = File.read(full_config_path)
      YAML.load(config_file)
    else
      File.write(full_config_path, skeleton_pairest_config)
      puts 'Creating ~/.pairest.yml for you. Edit it before you continue'
      raise SystemExit
    end
  end

  def self.skeleton_pairest_config
    "hp:\n" \
    "  name: Haskell Pointer\n" \
    "  email: kyle.pointer@asynchrony.com\n" \
    "  key_name: kyle.pointer\n" \
    "eu:\n" \
    "  name: Example User\n" \
    "  email: example.user@somewhere.com\n" \
    "  key_name: example.user\n"
  end
end
