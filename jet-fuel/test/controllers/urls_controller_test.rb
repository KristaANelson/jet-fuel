require "test_helper"

class UrlsControllerTest < ActionController::TestCase
  test "should create url" do
    assert_difference("Url.count") do
      post :create, url: {full_url: "www.thisislong.com"}
    end
    assert_redirected_to url_path(Url.last)
  end
end
