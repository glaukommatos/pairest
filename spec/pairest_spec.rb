describe Pairest do
  describe '.main' do
    after(:each) do
      Pairest.instance_variable_set :@configs, nil
    end

    it 'reads configurations and writes new settings' do
      user_configurations = [
        UserConfiguration.new(initials: 'hp',
                              email: 'haskell.pointer@asynchrony.com',
                              key: 'haskell.pointer',
                              name: 'Haskell Pointer'),
        UserConfiguration.new(initials: 'bl',
                              name: 'Brian Lai',
                              email: 'brian.lai@asynchrony.com',
                              key: 'brian.lai')
      ]

      expect(ConfigurationProvider)
        .to receive(:user_configurations) { user_configurations }

      expect(GitConfigurator).to receive(:write_name_setting)
        .with('Haskell Pointer, Brian Lai')

      expect(GitConfigurator).to receive(:write_email_settings)
        .with('haskell.pointer@asynchrony.com, brian.lai@asynchrony.com')

      expect(SshConfigurator).to receive(:link_current_key)
        .with('haskell.pointer')

      Pairest.main(%w(hp bl))
    end

    it 'uses the order the initials passed in and not the YAML file' do
      user_configurations = [
        UserConfiguration.new(initials: 'hp',
                              email: 'haskell.pointer@asynchrony.com',
                              key: 'haskell.pointer',
                              name: 'Haskell Pointer'),
        UserConfiguration.new(initials: 'bl',
                              name: 'Brian Lai',
                              email: 'brian.lai@asynchrony.com',
                              key: 'brian.lai')
      ]

      expect(ConfigurationProvider)
        .to receive(:user_configurations) { user_configurations }

      expect(GitConfigurator).to receive(:write_name_setting)
        .with('Brian Lai, Haskell Pointer')

      expect(GitConfigurator).to receive(:write_email_settings)
        .with('brian.lai@asynchrony.com, haskell.pointer@asynchrony.com')

      expect(SshConfigurator).to receive(:link_current_key)
        .with('brian.lai')

      Pairest.main(%w(bl hp))
    end

    it 'throws an exception if you pass in bad initials' do
      user_configurations = [
        UserConfiguration.new(initials: 'hp',
                              email: 'haskell.pointer@asynchrony.com',
                              key: 'haskell.pointer',
                              name: 'Haskell Pointer'),
        UserConfiguration.new(initials: 'bl',
                              name: 'Brian Lai',
                              email: 'brian.lai@asynchrony.com',
                              key: 'brian.lai')
      ]

      expect(ConfigurationProvider)
        .to receive(:user_configurations) { user_configurations }

      expect { Pairest.main(%w(pp)) }
        .to raise_error 'Unknown initials: pp. Add pp to ~/.pairest.yml'
    end

    it 'prints a usage message if no arguments are passed ' do
      usage_message = "Usage: pairest [initials] [initials]\n" \
                      "Example: pairest hp ko\n" \
                      "         pairest hp\n" \
                      "         pairest hp ko bl\n"

      expect(STDOUT).to receive(:puts).with(usage_message)

      expect { Pairest.main([]) }
        .to raise_error SystemExit
    end
  end
end
