require 'test_helper'

class UrlsStatisticsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "As a guest, on the root I expect to see URLS sorted by popularity" do
    url1 = Url.create(full_url: "https://www.google.com/", visit_count: 4)

    visit root_path

    assert page.has_link?(url1.short_url, :match => :first)
  end
end
