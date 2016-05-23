class ApplicationMailer < Devise::Mailer
  before_action :default_opts

  private

  def default_opts
    opts[:from] = ENV['EMAIL_USER']
  end
end
