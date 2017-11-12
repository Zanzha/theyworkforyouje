require 'test_helper'

class ImportTermsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get import_terms_index_url
    assert_response :success
  end

  test "should get show" do
    get import_terms_show_url
    assert_response :success
  end

end
