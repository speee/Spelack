class ApplicationMailer < ActionMailer::Base
  after_action :set_envelope_from

  private

  def set_envelope_from
    mail.smtp_envelope_from = ENV['EMAIL_USER']
  end
end
