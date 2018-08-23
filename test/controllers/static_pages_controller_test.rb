require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_page_url(:home)
    assert_response :success
  end

  test "should get help" do
    get static_page_url(:help)
    assert_response :success
  end

end
