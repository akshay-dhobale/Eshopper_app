require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get sales_report" do
    get reports_sales_report_url
    assert_response :success
  end

  test "should get customer_registered" do
    get reports_customer_registered_url
    assert_response :success
  end

  test "should get coupons_used" do
    get reports_coupons_used_url
    assert_response :success
  end

end
