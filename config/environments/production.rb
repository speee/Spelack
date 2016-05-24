Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true
  config.action_mailer.default_url_options = { host: '52.193.153.0', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_options = { from: ENV['EMAIL_USER'] }
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'smtp.gmail.com',
    :user_name => ENV['EMAIL_USER'],
    :password => ENV['EMAIL_PASSWORD'],
    :authentication => 'login',
    :openssl_verify_mode  => 'none'
  }
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  Rails.application.config.action_cable.allowed_request_origins = ['http://52.193.153.0:28080']

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb
  config.assets.precompile +=  %w( *.woff *.woff2 *.eot *.svg *.ttf )

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false
end
