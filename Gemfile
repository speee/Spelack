ruby '2.2.3'

source 'https://rubygems.org' do
  gem 'coffee-rails'
  gem 'jbuilder'
  gem 'jquery-rails'
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
  gem 'kakurenbo-puti'

  group :doc do
    gem 'yard'
  end
  group :development do
    gem 'web-console', '~> 2.0'
    gem 'capistrano'
    gem 'capistrano-rails'
    gem 'capistrano-rbenv'
    gem 'capistrano-bundler'
    gem 'capistrano3-unicorn'
    gem 'capistrano3-puma'
  end

  group :development, :test do
    gem 'better_errors'
    gem 'bullet'
    gem 'factory_girl_rails'
    gem 'ffaker'
    gem 'launchy'
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'rubocop', require: false
  end

  group :test do
    gem 'capybara'
    gem 'capybara-screenshot'
    gem 'database_rewinder'
    gem 'json_expressions'
    gem 'rspec-rails'
    gem 'rspec_junit_formatter'
    gem 'poltergeist'
    gem 'validation_examples_matcher'
    gem 'simplecov', require: false
  end

  group :production do
    gem 'unicorn', '~> 4.9.0'
  end
end
