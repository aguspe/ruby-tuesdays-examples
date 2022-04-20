require_relative 'page'

class LoginPage < Page

  # Actions

  def login(username, password)
    username_text_field.set username
    password_text_field.set password
    login_button.click
  end

  # Value

  def warning_text
    warning.text
  end

  # Validations

  def validate_warning(text)
    expect(warning_text).to eq text
  end

  # Elements

  def username_text_field
    @browser.text_field(id: 'loginFrm_loginname')
  end

  def password_text_field
    @browser.text_field(id: 'loginFrm_password')
  end

  def login_button
    @browser.button(xpath: "//button[@title='Login']")
  end

  def header
    @browser.element(class: 'menu_text')
  end

  def warning
    @browser.element(class: 'alert alert-error alert-danger')
  end
end
