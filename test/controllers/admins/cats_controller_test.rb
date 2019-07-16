require 'test_helper'

class Admins::CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_cats_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_cats_show_url
    assert_response :success
  end

end
