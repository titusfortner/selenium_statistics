require 'selenium-webdriver'
require 'selenium_statistics/logger'

#
# Returns logger instance that can be used throughout Selenium Run.
#
# @return [Logger]
#

module SeleniumStatistics
  def self.logger
    @logger ||= SeleniumStatistics::Logger.new
  end
end

require 'selenium_statistics/statistics'
require 'selenium_statistics/bridge'
