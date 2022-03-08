require 'selenium-webdriver'
require 'watir'
require 'webdrivers'

describe 'On the login page' do
  before(:example) do
    @browser = Watir::Browser.new :chrome
    @browser.goto('https://automationteststore.com/index.php?rt=account/login')
  end

  context 'A user can' do
    it 'login with the right credentials' do
      @browser.element(id: 'loginFrm_loginname').send_keys('aguspe')
      @browser.element(id: 'loginFrm_password').send_keys('12341234')
      @browser.element(xpath: "//button[@title='Login']").click
      expect(@browser.element(class: 'menu_text').text).to eq 'Welcome back Agustin'
    end
  end

  context 'A user cannot' do
    it 'login with the wrong credentials' do
      @browser.element(id: 'loginFrm_loginname').send_keys('wrongName')
      @browser.element(id: 'loginFrm_password').send_keys('wrongPassword')
      @browser.element(xpath: "//button[@title='Login']").click
      expect(@browser.element(class: 'alert alert-error alert-danger').text).to eq 'Error: Incorrect login or password provided.'
    end
  end

  after(:example) do
    @browser.quit
  end
end
