describe Pairest do
  describe '.main' do
    it 'is' do
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
  end
end
