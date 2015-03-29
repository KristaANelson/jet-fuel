require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "valid with a full_url" do
    url = Url.new(full_url: "https://mail.google.com/")

    assert url.valid?
  end

  test "invalid without a full_url" do
    url = Url.new(short_url: "https://mail.google.com")

    refute url.valid?
  end

  test "creates a short_url before create" do
    url = Url.new(full_url: "https://mail.google.com")
    url.save

    assert url.short_url
  end
end
