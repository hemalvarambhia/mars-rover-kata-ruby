# In spec/spec_helper.rb or spec/rails_helper.rb
require 'logger'

RSpec.configure do |config|
  config.before(:suite) do
    $logger = Logger.new(STDOUT)
    $logger.level = Logger::DEBUG
  end
end
