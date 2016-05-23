class ApplicationMailer < Devise::Mailer
  before_action :default_opts

  private

  def default_opts
    default from: ENV['EMAIL_USER']
  end
end
