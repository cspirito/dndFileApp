require 'test_helper'

class ShareControllerTest < ActionController::TestCase
  test "should get file" do
    get :file
    assert_response :success
  end

end
