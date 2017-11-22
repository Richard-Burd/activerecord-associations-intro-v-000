require_relative '../config/environment'
require 'rake'
load './Rakefile'

#ActiveRecord::Base.logger = Logger.new(STDOUT) # this thing isn't working so far.


RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.log_level = :debug                            # this is trying to get the logger to work

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.order = 'default'

end
