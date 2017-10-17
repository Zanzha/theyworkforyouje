require 'test_helper'

class PropositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposition = propositions(:one)
  end

  test "should get index" do
    get propositions_url
    assert_response :success
  end

  test "should get new" do
    get new_proposition_url
    assert_response :success
  end

  test "should create proposition" do
    assert_difference('Proposition.count') do
      post propositions_url, params: { proposition: { politician_id: @proposition.politician_id, proposition_date: @proposition.proposition_date, reference: @proposition.reference, title: @proposition.title, vote_date: @proposition.vote_date } }
    end

    assert_redirected_to proposition_url(Proposition.last)
  end

  test "should show proposition" do
    get proposition_url(@proposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposition_url(@proposition)
    assert_response :success
  end

  test "should update proposition" do
    patch proposition_url(@proposition), params: { proposition: { politician_id: @proposition.politician_id, proposition_date: @proposition.proposition_date, reference: @proposition.reference, title: @proposition.title, vote_date: @proposition.vote_date } }
    assert_redirected_to proposition_url(@proposition)
  end

  test "should destroy proposition" do
    assert_difference('Proposition.count', -1) do
      delete proposition_url(@proposition)
    end

    assert_redirected_to propositions_url
  end
end
