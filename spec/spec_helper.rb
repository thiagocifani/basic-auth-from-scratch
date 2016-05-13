ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "database_cleaner"
require "capybara/rails"
require "factory_girl"
require "shoulda/matchers"

RSpec.configure do |config|

  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.alias_it_should_behave_like_to :it_has_behavior, "has behavior:"

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end

  Capybara.configure do |c|
    c.always_include_port = true
    c.javascript_driver   = :selenium
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      # Choose a test framework:
      with.test_framework :rspec

      with.library :active_record
      with.library :rails
    end
  end
end
