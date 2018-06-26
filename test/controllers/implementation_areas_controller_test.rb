require 'test_helper'

class ImplementationAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @implementation_area = implementation_areas(:one)
  end

  test "should get index" do
    get implementation_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_implementation_area_url
    assert_response :success
  end

  test "should create implementation_area" do
    assert_difference('ImplementationArea.count') do
      post implementation_areas_url, params: { implementation_area: { contact_person: @implementation_area.contact_person, district: @implementation_area.district, email: @implementation_area.email, phone_number: @implementation_area.phone_number, project_id: @implementation_area.project_id, region_id: @implementation_area.region_id, zone: @implementation_area.zone } }
    end

    assert_redirected_to implementation_area_url(ImplementationArea.last)
  end

  test "should show implementation_area" do
    get implementation_area_url(@implementation_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_implementation_area_url(@implementation_area)
    assert_response :success
  end

  test "should update implementation_area" do
    patch implementation_area_url(@implementation_area), params: { implementation_area: { contact_person: @implementation_area.contact_person, district: @implementation_area.district, email: @implementation_area.email, phone_number: @implementation_area.phone_number, project_id: @implementation_area.project_id, region_id: @implementation_area.region_id, zone: @implementation_area.zone } }
    assert_redirected_to implementation_area_url(@implementation_area)
  end

  test "should destroy implementation_area" do
    assert_difference('ImplementationArea.count', -1) do
      delete implementation_area_url(@implementation_area)
    end

    assert_redirected_to implementation_areas_url
  end
end
