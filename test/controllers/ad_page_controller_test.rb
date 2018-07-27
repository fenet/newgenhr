require 'test_helper'

class AdPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ad_page_index_url
    assert_response :success
  end

end
