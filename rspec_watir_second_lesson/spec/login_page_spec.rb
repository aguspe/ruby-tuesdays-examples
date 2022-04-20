require_relative '../pages/login_page'
require_relative 'spec_helper'

describe 'On the login page' do
  let(:user_name) { 'aguspe' }
  let(:login_page) { LoginPage.new(@browser) }

  before(:example) do
    login_page.redirect 'https://automationteststore.com/index.php?rt=account/login'
    login_page.login(user_name, password)
  end

  context 'A user can' do
    let(:password) { '12341234' }

    subject { login_page.header.text }

    it 'login with the right credentials' do
      expect(subject).to eq 'Welcome back Agustin'
    end
  end

  context 'A user cannot' do
    let(:password) { 'wrongPassword' }

    it 'login with the wrong credentials' do
      login_page.validate_warning 'Error: Incorrect login or password provided.'
    end
  end
end
