class ApplicationMailer < ActionMailer::Base
     default from: ENV['EMAIL_USER']
end
