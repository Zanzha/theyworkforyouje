require 'test_helper'

class ImportPoliticiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @import_politician = import_politicians(:one)
  end

  test "should get index" do
    get import_politicians_url
    assert_response :success
  end

  test "should get new" do
    get new_import_politician_url
    assert_response :success
  end

  test "should create import_politician" do
    assert_difference('ImportPolitician.count') do
      post import_politicians_url, params: { import_politician: {  } }
    end

    assert_redirected_to import_politician_url(ImportPolitician.last)
  end

  test "should show import_politician" do
    get import_politician_url(@import_politician)
    assert_response :success
  end

  test "should get edit" do
    get edit_import_politician_url(@import_politician)
    assert_response :success
  end

  test "should update import_politician" do
    patch import_politician_url(@import_politician), params: { import_politician: {  } }
    assert_redirected_to import_politician_url(@import_politician)
  end

  test "should destroy import_politician" do
    assert_difference('ImportPolitician.count', -1) do
      delete import_politician_url(@import_politician)
    end

    assert_redirected_to import_politicians_url
  end
end
