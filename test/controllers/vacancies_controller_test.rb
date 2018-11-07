require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vacancies_index_url
    assert_response :success
  end

  test "should get edit" do
    get vacancies_edit_url
    assert_response :success
  end

  test "should get new" do
    get vacancies_new_url
    assert_response :success
  end

  test "should get delete" do
    get vacancies_delete_url
    assert_response :success
  end

  test "should get show" do
    get vacancies_show_url
    assert_response :success
  end

end
