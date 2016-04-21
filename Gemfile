ruby '2.2.3'

source 'https://rubygems.org' do
  gem 'coffee-rails'
  gem 'jbuilder'
  gem 'mysql2', '~> 0.3.20'
  gem 'rails', '4.2.4'
  gem 'sass-rails'
  gem 'slim-rails'
  gem 'uglifier'
  gem 'google-api-client'
  gem 'devise'
  gem 'paperclip'
  gem 'carrierwave'
  gem 'amazon-ec2'
  gem 'link_thumbnailer'

  group :doc do
    gem 'yard'
  end
  group :development do
    gem 'web-console', '~> 2.0'
  end

  group :development, :test do
    gem 'better_errors'
    gem 'validation_examples_matcher'
    gem 'bullet'
    gem 'capybara'
    gem 'capybara-screenshot'
    gem 'factory_girl_rails'
    gem 'ffaker'
    gem 'json_expressions'
    gem 'launchy'
    gem 'poltergeist'
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'rubocop', require: false
  end

  group :test do
    gem 'database_rewinder'
    gem 'rspec-rails'
    gem 'rspec_junit_formatter'
    gem 'simplecov', require: false
  end

  group :production do
    gem 'unicorn', '~> 4.9.0'
  end
end
