require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'
require 'vcr'
require 'webmock/rspec'
require 'capybara/rspec'

RSpec.configure do |config|
  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    # 'description` and `failure_message` of custom matchers.
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  # rspec-mocks config goes here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on a real object.
    mocks.verify_partial_doubles = true
  end
  # Limits the available syntax to the non-monkey patched syntax that is recommended.
  config.disable_monkey_patching!
  # Print the 10 slowest examples and example groups at the end of the spec run.
  config.profile_examples = 5
  # Run specs in random order to surface order dependencies.
  config.order = :random
  # Allows RSpec to persist some state between runs in order to support the `--only-failures` and `--next-failure` CLI options.
  config.example_status_persistence_file_path = 'spec/specs.txt'
  # Allow more verbose output when running an individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output, unless a formatter has already been configured via a command-line flag.
    config.default_formatter = 'doc'
  end
  # Remove this line if you're not using ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # Run each of your examples within an ActiveRecord type transaction.
  config.use_transactional_fixtures = true
  # RSpec Rails will automatically mix in different behaviours to your tests based on their file location
  config.infer_spec_type_from_file_location!
  # Reduce the noise from Rails gems in failure output.
  config.filter_rails_from_backtrace!
  # Include Devise Test Helpers for controller tests only
  config.include Devise::TestHelpers, type: 'controller'
end
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ActiveRecord::Migration.maintain_test_schema!

# Configure VCR to perform and record API requests
VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

ENV['RAILS_ENV'] ||= 'test'
abort('The Rails environment is running in production mode!') if Rails.env.production?
