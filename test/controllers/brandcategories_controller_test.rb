require 'test_helper'

class BrandcategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get brandcategories_show_url
    assert_response :success
  end

end
