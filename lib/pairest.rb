require_relative 'configuration_provider'
require_relative 'git_configurator'
require_relative 'ssh_configurator'
require_relative 'user_configuration'

class Pairest
  def self.main(initials)
    check_configuration

    GitConfigurator.write_name_setting names(initials)
    GitConfigurator.write_email_settings emails(initials)
    SshConfigurator.link_current_key key(initials)
  end

  private_class_method

  def self.check_configuration
    ssh_config_path = File.expand_path('~/.ssh/config')

    unless File.exist? ssh_config_path
      puts 'Creating ~/.ssh/config for you... please modify before using'
      File.write(File.expand_path('~/.ssh/config'), skeleton_config)
    end
  end

  def self.skeleton_config
    "Host dev.example.com\n" \
    "  HostName dev.example.com\n" \
    "  User git\n" \
    "  IdentityFile ~/.ssh/current_key\n"
  end

  def self.configs(initials)
    @config ||=
      ConfigurationProvider.user_configurations
                           .select { |uc| initials.include? uc.initials }
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
