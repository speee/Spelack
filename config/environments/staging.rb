Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.session_store :redis_store,
      servers: 'redis://spelackec-001.apvows.0001.apne1.cache.amazonaws.com:6379/0',
      expire_in: 1.day
  config.assets.js_compressor = :uglifier
  Rails.application.config.action_cable.allowed_request_origins = ['http://52.196.227.190']
  config.action_mailer.default_url_options = { host: '52.196.227.190' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_options = { from: ENV['EMAIL_USER'] }
  config.action_mailer.smtp_settings = {
    enable_starttls_auto: true,
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'smtp.gmail.com',
    user_name: ENV['EMAIL_USER'],
    password: ENV['EMAIL_PASSWORD'],
    from: ENV['EMAIL_USER'],
    authentication: 'login',
    openssl_verify_mode: 'none',
  }
  config.assets.compile = false

  config.assets.digest = true

  config.log_level = :debug

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false
end
