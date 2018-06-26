require 'test_helper'

class InstitutionStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institution_status = institution_statuses(:one)
  end

  test "should get index" do
    get institution_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_institution_status_url
    assert_response :success
  end

  test "should create institution_status" do
    assert_difference('InstitutionStatus.count') do
      post institution_statuses_url, params: { institution_status: { name: @institution_status.name } }
    end

    assert_redirected_to institution_status_url(InstitutionStatus.last)
  end

  test "should show institution_status" do
    get institution_status_url(@institution_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_institution_status_url(@institution_status)
    assert_response :success
  end

  test "should update institution_status" do
    patch institution_status_url(@institution_status), params: { institution_status: { name: @institution_status.name } }
    assert_redirected_to institution_status_url(@institution_status)
  end

  test "should destroy institution_status" do
    assert_difference('InstitutionStatus.count', -1) do
      delete institution_status_url(@institution_status)
    end

    assert_redirected_to institution_statuses_url
  end
end
