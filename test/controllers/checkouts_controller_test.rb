require 'test_helper'

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get address_select" do
    get checkouts_address_select_url
    assert_response :success
  end

  test "should get payment_review" do
    get checkouts_payment_review_url
    assert_response :success
  end

  test "should get payment_option" do
    get checkouts_payment_option_url
    assert_response :success
  end

end
