require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term = terms(:one)
  end

  test "should get index" do
    get terms_url
    assert_response :success
  end

  test "should get new" do
    get new_term_url
    assert_response :success
  end

  test "should create term" do
    assert_difference('Term.count') do
      post terms_url, params: { term: { Date_of_birth: @term.Date_of_birth, facebook_url: @term.facebook_url, first_name: @term.first_name, gender: @term.gender, last_name: @term.last_name, middle_name: @term.middle_name, parishid: @term.parishid, title: @term.title, website_url: @term.website_url } }
    end

    assert_redirected_to term_url(Term.last)
  end

  test "should show term" do
    get term_url(@term)
    assert_response :success
  end

  test "should get edit" do
    get edit_term_url(@term)
    assert_response :success
  end

  test "should update term" do
    patch term_url(@term), params: { term: { Date_of_birth: @term.Date_of_birth, facebook_url: @term.facebook_url, first_name: @term.first_name, gender: @term.gender, last_name: @term.last_name, middle_name: @term.middle_name, parishid: @term.parishid, title: @term.title, website_url: @term.website_url } }
    assert_redirected_to term_url(@term)
  end

  test "should destroy term" do
    assert_difference('Term.count', -1) do
      delete term_url(@term)
    end

    assert_redirected_to terms_url
  end
end
