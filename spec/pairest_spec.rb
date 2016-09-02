describe Pairest do
  describe '.main' do
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
        .with('Brian Lai, Haskell Pointer')

      expect(GitConfigurator).to receive(:write_email_settings)
        .with('brian.lai@asynchrony.com, haskell.pointer@asynchrony.com')

      expect(SshConfigurator).to receive(:link_current_key)
        .with('brian.lai')

      Pairest.main(%w(bl hp))
    end
  end
end
