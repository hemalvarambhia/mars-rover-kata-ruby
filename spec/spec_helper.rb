# In spec/spec_helper.rb or spec/rails_helper.rb
require 'logger'
require_relative '../lib/errors/cannot_command_mars_rover'
require_relative '../lib/errors/cannot_initialize_mars_rover'
require_relative '../lib/mars_rover'

RSpec.configure do |config|
  config.before(:suite) do
    $logger = Logger.new(STDOUT)
    $logger.level = Logger::DEBUG
  end
end
