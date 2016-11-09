require 'test_helper'

class SaveControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get save_create_url
    assert_response :success
  end

  test "should get destroy" do
    get save_destroy_url
    assert_response :success
  end

end
