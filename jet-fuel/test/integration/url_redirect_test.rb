require 'test_helper'
require 'capybara/rails'


class UrlRedirectTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "As a guest, when I visit the site I can give a url to the service" do
    visit '/'
    expect(page).to have_content?('Jet Fuel')
  end
end
