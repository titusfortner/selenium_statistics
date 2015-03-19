require_relative 'spec_helper'

describe 'Selenium Statistics' do

  let(:driver) {Selenium::WebDriver.for :chrome}
  let(:html) { File.expand_path(File.dirname(__FILE__) + '/html/test.html') }

  after(:each) do
    driver.quit
  end

  specify 'records total command count' do
    driver.get "file://#{html}"
    driver.title
    expect(SeleniumStatistics.executions).to eql(2)
  end

  specify 'records total command time' do
    driver.get "file://#{html}"
    driver.title
    expect(SeleniumStatistics.executions).to eql(2)
  end

  specify 'records time and count for each command' do
    driver.get "file://#{html}"
    driver.title

    expect(SeleniumStatistics.getTitle[:count]).to eql(1)
    expect(SeleniumStatistics.getTitle[:time]).to be > 0
  end

end
