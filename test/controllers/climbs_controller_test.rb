require 'test_helper'

class ClimbsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get climbs_new_url
    assert_response :success
  end

  test "should get create" do
    get climbs_create_url
    assert_response :success
  end

  test "should get update" do
    get climbs_update_url
    assert_response :success
  end

  test "should get edit" do
    get climbs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get climbs_destroy_url
    assert_response :success
  end

  test "should get index" do
    get climbs_index_url
    assert_response :success
  end

  test "should get show" do
    get climbs_show_url
    assert_response :success
  end

end
