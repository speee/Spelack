class ApplicationMailer < Devise::Mailer
  default from: ENV['EMAIL_USER']
end
