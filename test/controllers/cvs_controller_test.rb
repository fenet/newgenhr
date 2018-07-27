require 'test_helper'

class CvsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cvs_index_url
    assert_response :success
  end

  test "should get edit" do
    get cvs_edit_url
    assert_response :success
  end

  test "should get delete" do
    get cvs_delete_url
    assert_response :success
  end

  test "should get new" do
    get cvs_new_url
    assert_response :success
  end

  test "should get show" do
    get cvs_show_url
    assert_response :success
  end

end
