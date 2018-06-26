require 'test_helper'

class ProjectAmendmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_amendment = project_amendments(:one)
  end

  test "should get index" do
    get project_amendments_url
    assert_response :success
  end

  test "should get new" do
    get new_project_amendment_url
    assert_response :success
  end

  test "should create project_amendment" do
    assert_difference('ProjectAmendment.count') do
      post project_amendments_url, params: { project_amendment: { amendment_reason: @project_amendment.amendment_reason, from: @project_amendment.from, project_id: @project_amendment.project_id, to: @project_amendment.to } }
    end

    assert_redirected_to project_amendment_url(ProjectAmendment.last)
  end

  test "should show project_amendment" do
    get project_amendment_url(@project_amendment)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_amendment_url(@project_amendment)
    assert_response :success
  end

  test "should update project_amendment" do
    patch project_amendment_url(@project_amendment), params: { project_amendment: { amendment_reason: @project_amendment.amendment_reason, from: @project_amendment.from, project_id: @project_amendment.project_id, to: @project_amendment.to } }
    assert_redirected_to project_amendment_url(@project_amendment)
  end

  test "should destroy project_amendment" do
    assert_difference('ProjectAmendment.count', -1) do
      delete project_amendment_url(@project_amendment)
    end

    assert_redirected_to project_amendments_url
  end
end
