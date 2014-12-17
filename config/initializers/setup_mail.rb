# if Rails.env != 'test'
#   email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
#   ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
#   print ActionMailer::Base.smtp_settings
# end

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => 'fileshare597',
            :password             => 'swapneel',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end