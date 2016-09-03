require_relative 'configuration_provider'
require_relative 'git_configurator'
require_relative 'ssh_configurator'
require_relative 'user_configuration'

class Pairest
  def self.main(initials)
    GitConfigurator.write_name_setting names(initials)
    GitConfigurator.write_email_settings emails(initials)
    SshConfigurator.link_current_key key(initials)
  end

  private_class_method

  def self.configs(initials)
    @configs ||= ConfigurationProvider.user_configurations

    initials.map do |initial|
      user_config = @configs.find { |config| config.initials == initial }
      unless user_config
        raise "Unknown initials: #{initial}. Add #{initial} to ~/.pairest.yml"
      end
      user_config
    end
  end

  def self.key(initials)
    first_config = configs(initials).first
    first_config.key
  end

  def self.names(initials)
    configs(initials).map(&:name).join(', ')
  end

  def self.emails(initials)
    configs(initials).map(&:email).join(', ')
  end
end
