require 'bundler/setup'
require "sinatra/activerecord"
Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

logger =  Logger.new(STDOUT)
logger.level = Logger::DEBUG
logger.debug("TEST")
ActiveRecord::Base.logger = logger
ActiveRecord::Base.logger.level = 4                 # this isn't working
#ActiveRecord::Base.logger = Log4r::Logger.new("Application Log")      # this isn't working
