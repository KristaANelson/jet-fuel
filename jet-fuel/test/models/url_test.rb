require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "valid with a full_url" do
    url = Url.new(full_url: "www.google.com")
    assert url.valid?
  end

  test "invalid without a full_url" do
    url = Url.new(short_url: "www.google.com")
    refute url.valid?
  end
end
