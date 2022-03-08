require 'selenium-webdriver'
require 'watir'
require 'webdrivers'

describe 'On the login page' do
  let(:browser) { Watir::Browser.new :chrome }
  let(:user_name) { 'aguspe' }

  before(:example) do
    browser.goto('https://automationteststore.com/index.php?rt=account/login')
    username_text_field.set user_name
    password_text_field.set password
    login_button.click
  end

  context 'A user can' do
    let(:password) { '12341234' }

    subject { header.text }

    it 'login with the right credentials' do
      expect(subject).to eq 'Welcome back Agustin'
    end
  end

  context 'A user cannot' do
    let(:password) { 'wrongPassword' }

    it 'login with the wrong credentials' do
      expect(browser.element(class: 'alert alert-error alert-danger').text).to eq 'Error: Incorrect login or password provided.'
    end
  end

  after(:example) do
    browser.quit
  end
end

def username_text_field
  browser.text_field(id: 'loginFrm_loginname')
end

def password_text_field
  browser.text_field(id: 'loginFrm_password')
end

def login_button
  browser.button(xpath: "//button[@title='Login']")
end

def header
  browser.element(class: 'menu_text')
end