require 'test_helper'

class ProjectExtentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_extention = project_extentions(:one)
  end

  test "should get index" do
    get project_extentions_url
    assert_response :success
  end

  test "should get new" do
    get new_project_extention_url
    assert_response :success
  end

  test "should create project_extention" do
    assert_difference('ProjectExtention.count') do
      post project_extentions_url, params: { project_extention: { activity_change: @project_extention.activity_change, approval_status: @project_extention.approval_status, budget_change: @project_extention.budget_change, ia_change: @project_extention.ia_change, project_id: @project_extention.project_id, subject: @project_extention.subject, within_project_duration: @project_extention.within_project_duration } }
    end

    assert_redirected_to project_extention_url(ProjectExtention.last)
  end

  test "should show project_extention" do
    get project_extention_url(@project_extention)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_extention_url(@project_extention)
    assert_response :success
  end

  test "should update project_extention" do
    patch project_extention_url(@project_extention), params: { project_extention: { activity_change: @project_extention.activity_change, approval_status: @project_extention.approval_status, budget_change: @project_extention.budget_change, ia_change: @project_extention.ia_change, project_id: @project_extention.project_id, subject: @project_extention.subject, within_project_duration: @project_extention.within_project_duration } }
    assert_redirected_to project_extention_url(@project_extention)
  end

  test "should destroy project_extention" do
    assert_difference('ProjectExtention.count', -1) do
      delete project_extention_url(@project_extention)
    end

    assert_redirected_to project_extentions_url
  end
end
