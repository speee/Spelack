class MyMailer < ActionMailer::Base

  # Default email address is required
  default from: ENV['EMAIL_USER']

end
