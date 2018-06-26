require 'test_helper'

class ReportingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reporting_type = reporting_types(:one)
  end

  test "should get index" do
    get reporting_types_url
    assert_response :success
  end

  test "should get new" do
    get new_reporting_type_url
    assert_response :success
  end

  test "should create reporting_type" do
    assert_difference('ReportingType.count') do
      post reporting_types_url, params: { reporting_type: { name: @reporting_type.name } }
    end

    assert_redirected_to reporting_type_url(ReportingType.last)
  end

  test "should show reporting_type" do
    get reporting_type_url(@reporting_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_reporting_type_url(@reporting_type)
    assert_response :success
  end

  test "should update reporting_type" do
    patch reporting_type_url(@reporting_type), params: { reporting_type: { name: @reporting_type.name } }
    assert_redirected_to reporting_type_url(@reporting_type)
  end

  test "should destroy reporting_type" do
    assert_difference('ReportingType.count', -1) do
      delete reporting_type_url(@reporting_type)
    end

    assert_redirected_to reporting_types_url
  end
end
