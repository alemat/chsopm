require 'test_helper'

class FundingStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funding_status = funding_statuses(:one)
  end

  test "should get index" do
    get funding_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_funding_status_url
    assert_response :success
  end

  test "should create funding_status" do
    assert_difference('FundingStatus.count') do
      post funding_statuses_url, params: { funding_status: { name: @funding_status.name } }
    end

    assert_redirected_to funding_status_url(FundingStatus.last)
  end

  test "should show funding_status" do
    get funding_status_url(@funding_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_funding_status_url(@funding_status)
    assert_response :success
  end

  test "should update funding_status" do
    patch funding_status_url(@funding_status), params: { funding_status: { name: @funding_status.name } }
    assert_redirected_to funding_status_url(@funding_status)
  end

  test "should destroy funding_status" do
    assert_difference('FundingStatus.count', -1) do
      delete funding_status_url(@funding_status)
    end

    assert_redirected_to funding_statuses_url
  end
end
