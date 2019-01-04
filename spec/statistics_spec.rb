require_relative 'spec_helper'

describe 'Selenium Statistics' do

  let(:driver) {Selenium::WebDriver.for :chrome}
  let(:html) { File.expand_path(File.dirname(__FILE__) + '/html/test.html') }

  after(:each) do
    driver.quit
  end

  it 'records total command count' do
    driver.get "file://#{html}"
    driver.title
    expect(SeleniumStatistics.executions).to eql(3)
  end

  it 'records total command time' do
    driver.get "file://#{html}"
    driver.title
    expect(SeleniumStatistics.executions).to eql(3)
  end

  it 'records time and count for each command' do
    driver.get "file://#{html}"
    driver.title

    expect(SeleniumStatistics.get_title[:count]).to eql(1)
    expect(SeleniumStatistics.get_title[:time]).to be > 0
  end

  it 'handles get_element_location' do
    driver.get "file://#{html}"
    element = driver.find_element(:tag_name, 'body')
    element.location_once_scrolled_into_view

    expect(SeleniumStatistics.commands).to have_key('get_element_location')
  end

  it 'handles get_element_css_value' do
    driver.get "file://#{html}"
    element = driver.find_element(:tag_name, 'body')
    element.css_value('whatever')

    expect(SeleniumStatistics.commands).to have_key('get_element_css_value')
  end
end
