require 'test_helper'

class SuperuserControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get superuser_dashboard_url
    assert_response :success
  end

end
