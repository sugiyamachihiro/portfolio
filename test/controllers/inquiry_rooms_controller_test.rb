require 'test_helper'

class InquiryRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get inquiry_rooms_show_url
    assert_response :success
  end

end
