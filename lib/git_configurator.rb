class GitConfigurator
  def self.write_name_setting(name_string)
    system "git config user.name \"#{name_string}\""
  end

  def self.write_email_settings(email_string)
    system "git config user.email \"#{email_string}\""
  end
end
