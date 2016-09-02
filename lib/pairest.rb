require_relative 'configuration_provider'
require_relative 'git_configurator'
require_relative 'ssh_configurator'
require_relative 'user_configuration'

class Pairest
  def self.main(initials)
    check_ssh_config_and_create_if_needed
    check_pairest_config_and_create_if_needed

    GitConfigurator.write_name_setting names(initials)
    GitConfigurator.write_email_settings emails(initials)
    SshConfigurator.link_current_key key(initials)
  end

  private_class_method

  # TODO: This method is not currently tested at all.
  def self.check_ssh_config_and_create_if_needed
    ssh_config_path = File.expand_path('~/.ssh/config')

    unless File.exist? ssh_config_path
      puts 'Creating ~/.ssh/config for you... please modify before using'
      File.write(File.expand_path('~/.ssh/config'), skeleton_ssh_config)
    end
  end

  # TODO: This method is not currently tested at all.
  def self.skeleton_ssh_config
    "Host dev.example.com\n" \
    "  HostName dev.example.com\n" \
    "  User git\n" \
    "  IdentityFile ~/.ssh/current_key\n"
  end

  # TODO: This method is not currently tested at all.
  def self.check_pairest_config_and_create_if_needed
    pairest_config_path = File.expand_path('~/.pairest.yml')

    unless File.exist? pairest_config_path
      puts 'Creating ~/.pairest.yml for you... please modify before using'
      File.write(File.expand_path('~/.pairest.yml'), skeleton_pairest_config)
    end
  end

  # TODO: This method is not currently tested at all.
  def self.skeleton_pairest_config
    "hp:\n" \
    "  name: Haskell Pointer\n" \
    "  email: kyle.pointer@asynchrony.com\n" \
    "  key_name: kyle.pointer\n" \
    "ko:\n" \
    "  name: Kali Olsen\n" \
    "  email: kali.olsen@asynchrony.com\n" \
    "  key_name: kali.olsen\n"
  end

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
