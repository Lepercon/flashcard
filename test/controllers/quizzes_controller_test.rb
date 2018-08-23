require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get random_quizzes_url
    assert_response :success
  end

end
