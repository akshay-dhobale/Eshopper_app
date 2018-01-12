require 'test_helper'

class CouponsUsedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coupons_useds_index_url
    assert_response :success
  end

end
