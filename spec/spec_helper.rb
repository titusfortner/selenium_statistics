require "selenium_statistics"
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    puts SeleniumStatistics.results
    SeleniumStatistics.reset!
  end

end
