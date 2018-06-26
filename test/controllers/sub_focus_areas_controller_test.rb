require 'test_helper'

class SubFocusAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_focus_area = sub_focus_areas(:one)
  end

  test "should get index" do
    get sub_focus_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_focus_area_url
    assert_response :success
  end

  test "should create sub_focus_area" do
    assert_difference('SubFocusArea.count') do
      post sub_focus_areas_url, params: { sub_focus_area: { description: @sub_focus_area.description, focus_area_id: @sub_focus_area.focus_area_id, name: @sub_focus_area.name } }
    end

    assert_redirected_to sub_focus_area_url(SubFocusArea.last)
  end

  test "should show sub_focus_area" do
    get sub_focus_area_url(@sub_focus_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_focus_area_url(@sub_focus_area)
    assert_response :success
  end

  test "should update sub_focus_area" do
    patch sub_focus_area_url(@sub_focus_area), params: { sub_focus_area: { description: @sub_focus_area.description, focus_area_id: @sub_focus_area.focus_area_id, name: @sub_focus_area.name } }
    assert_redirected_to sub_focus_area_url(@sub_focus_area)
  end

  test "should destroy sub_focus_area" do
    assert_difference('SubFocusArea.count', -1) do
      delete sub_focus_area_url(@sub_focus_area)
    end

    assert_redirected_to sub_focus_areas_url
  end
end
