ENV['RAILS_ENV'] ||= 'test'
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'
require 'vcr'
require 'webmock/rspec'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

# Configure VCR to perform and record API requests
VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
