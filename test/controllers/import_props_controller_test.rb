require 'test_helper'

class ImportPropsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get import_props_index_url
    assert_response :success
  end

  test "should get show" do
    get import_props_show_url
    assert_response :success
  end

end
