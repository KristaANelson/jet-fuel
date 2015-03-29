require "test_helper"

class  Api::V1::UrlsControllerTest < ActionController::TestCase
  test "#redirect" do
    url = Url.create(full_url: "http://www.turing.io")
    get :redirect, short_url: url.short_url, format: :json

    full_url = response.body
    assert_response :success
    assert_equal full_url, url['full_url']
  end

  test "#show" do
    url = Url.create(full_url: "http://turing.io/")
    get :show, id: url.id, format: :json

    shown_url = JSON.parse(response.body)
    assert_response :success
    assert_equal 0, shown_url["visit_count"]
  end

  test "#create" do
    post :create, format: :json, url: { full_url: "https://twitter.com" }

    url = JSON.parse(response.body)

    assert_response :success
    assert_equal "https://twitter.com", url["full_url"]
    assert_equal 0, url["visit_count"]
  end
end
