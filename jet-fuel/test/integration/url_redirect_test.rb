require 'test_helper'
require 'capybara/rails'


class UrlRedirectTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "As a guest, when I visit the site I can give a url to the service" do
    visit '/'
    assert page.has_content?('Jet Fuel')
    assert page.has_field?('url[:full_url]')
  end
end
