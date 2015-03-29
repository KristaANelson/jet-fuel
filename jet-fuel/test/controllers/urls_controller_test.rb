require "test_helper"

class UrlsControllerTest < ActionController::TestCase
  test "should create url" do
    assert_difference("Url.count") do
      post :create, url: {full_url: "https://mail.google.com"}
    end
    assert_redirected_to url_path(Url.last)
  end

  test "should redirect url" do
    url = Url.new(full_url: "https://mail.google.com")
    url.save
    get :redirect, short_url: url.short_url
    assert_redirected_to url.full_url
  end
end
