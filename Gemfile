# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Sass is an extension of CSS, adding nested rules, variables, mixins, selector inheritance, and more.
gem 'sassc', '~> 2.4.0'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'gem 'devise'
gem 'devise'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Brakeman detects security vulnerabilities in Ruby on Rails
  # applications via static analysis.
  gem 'brakeman', '~> 4.9.0', require: false
  # bundler-audit provides patch-level verification for Bundled apps.
  gem 'bundler-audit', '~> 0.7.0', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # ERB Linter tool.
  gem 'erb_lint', '~> 0.0.35', require: false
  # factory_bot provides a framework and DSL for defining and using factories
  gem 'factory_bot_rails', '~> 6.1.0'
  # Automatic Ruby code style checking tool. Aims to enforce
  # the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 0.89.1', require: false
  gem 'rubocop-performance', '~> 1.7.1', require: false
  gem 'rubocop-rails', '~> 2.7.1', require: false
  gem 'rubocop-rspec', '~> 1.43.2', require: false
  # Configurable tool for writing clean and consistent SCSS
  gem 'capybara'
  gem 'scss_lint', '~> 0.59.0', require: false
end

group :test do
  # Code coverage for Ruby 1.9+ with a powerful configuration library
  gem 'simplecov', '~> 0.19.0', require: false
  # Extracting `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '~> 1.0.5'
  # rspec-rails is a testing framework for Rails 3+.
  gem 'rspec-rails', '~> 4.0.1'
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 4.4.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
