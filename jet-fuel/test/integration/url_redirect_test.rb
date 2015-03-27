require 'test_helper'
require 'capybara/rails'


class UrlRedirectTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "As a guest, when I visit the site I can give a url to the service" do
    visit '/'
    assert page.has_content?("Jet Fuel")
    assert page.has_field?("url[full_url]")
  end

  test "As a guest, when I give a url I get back a service shortened URL" do
    long_url = "www.thisisareallylongurl.com/1234567"
    visit '/'
    fill_in 'url_full_url', with: long_url
    click_link_or_button("Make it shorter!")
    assert Url.find_by(full_url: long_url)
    assert page.has_content?(Url.last.short_url)
  end
end
