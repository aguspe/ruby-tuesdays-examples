require 'rspec'
require 'selenium-webdriver'
require 'watir'
require 'webdrivers'

RSpec.configure do |config|
  config.before(:example) do
    @browser = Watir::Browser.new :chrome
  end

  config.after do
    @browser.quit
  end
end