require 'test_helper'

class FundersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funder = funders(:one)
  end

  test "should get index" do
    get funders_url
    assert_response :success
  end

  test "should get new" do
    get new_funder_url
    assert_response :success
  end

  test "should create funder" do
    assert_difference('Funder.count') do
      post funders_url, params: { funder: { amount: @funder.amount, institution_id: @funder.institution_id, project_id: @funder.project_id } }
    end

    assert_redirected_to funder_url(Funder.last)
  end

  test "should show funder" do
    get funder_url(@funder)
    assert_response :success
  end

  test "should get edit" do
    get edit_funder_url(@funder)
    assert_response :success
  end

  test "should update funder" do
    patch funder_url(@funder), params: { funder: { amount: @funder.amount, institution_id: @funder.institution_id, project_id: @funder.project_id } }
    assert_redirected_to funder_url(@funder)
  end

  test "should destroy funder" do
    assert_difference('Funder.count', -1) do
      delete funder_url(@funder)
    end

    assert_redirected_to funders_url
  end
end
