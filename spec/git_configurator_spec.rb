describe GitConfigurator do
  describe '.write_name_setting' do
    it 'tells Git to write the user name string to its config' do
      expect(GitConfigurator).to receive(:system)
        .with('git config user.name "Name One, Name Two"')

      GitConfigurator.write_name_setting('Name One, Name Two')
    end

    it 'tells Git to write the email string to its config' do
      expect(GitConfigurator).to receive(:system)
        .with('git config user.email "email@email.com"')

      GitConfigurator.write_email_settings('email@email.com')
    end
  end
end
