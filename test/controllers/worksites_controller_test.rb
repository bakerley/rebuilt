require 'test_helper'

class WorksitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worksites_index_url
    assert_response :success
  end

  test "should get show" do
    get worksites_show_url
    assert_response :success
  end

  test "should get new" do
    get worksites_new_url
    assert_response :success
  end

  test "should get create" do
    get worksites_create_url
    assert_response :success
  end

  test "should get edit" do
    get worksites_edit_url
    assert_response :success
  end

  test "should get update" do
    get worksites_update_url
    assert_response :success
  end

  test "should get destroy" do
    get worksites_destroy_url
    assert_response :success
  end

end
