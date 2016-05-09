source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
gem 'uglifier'
gem 'jquery-rails'
gem 'turbolinks'
gem 'therubyracer', platforms: :ruby
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

#User Management
gem 'devise'

# Use Passenger as the app server
gem 'passenger'

group :development do
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-passenger'
  gem 'capistrano-chruby'
  gem 'web-console', '~> 2.0'
  gem 'byebug'
  gem 'rubocop', require: false
  gem 'rspec-rails'
end

group :test do
  #Describe how your code should work with RSpec
  gem 'rspec-rails'
  #Simulate user interaction for testing with Capybara
  gem 'capybara'
  #Record and test your HTTP interactions
  gem 'vcr'
  #Stub and mocking library used by vcr
  gem 'webmock'
end
