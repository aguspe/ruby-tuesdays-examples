class Page
  attr_accessor :browser

  def initialize(browser)
    @browser = browser
  end

  def visit(url)
    @browser.goto(url)
  end
  alias redirect visit
end
