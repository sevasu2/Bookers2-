require 'test_helper'

class RootsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roots_index_url
    assert_response :success
  end

  test "should get about" do
    get roots_about_url
    assert_response :success
  end

end
