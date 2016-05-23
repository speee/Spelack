Devise.setup do |config|
  config.mailer_sender = ENV['EMAIL_USER']
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.secret_key = ENV['SECRET_KEY_BASE']
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.scoped_views = true
end
