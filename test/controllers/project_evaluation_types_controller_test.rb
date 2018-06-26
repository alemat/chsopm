require 'test_helper'

class ProjectEvaluationTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_evaluation_type = project_evaluation_types(:one)
  end

  test "should get index" do
    get project_evaluation_types_url
    assert_response :success
  end

  test "should get new" do
    get new_project_evaluation_type_url
    assert_response :success
  end

  test "should create project_evaluation_type" do
    assert_difference('ProjectEvaluationType.count') do
      post project_evaluation_types_url, params: { project_evaluation_type: { name: @project_evaluation_type.name } }
    end

    assert_redirected_to project_evaluation_type_url(ProjectEvaluationType.last)
  end

  test "should show project_evaluation_type" do
    get project_evaluation_type_url(@project_evaluation_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_evaluation_type_url(@project_evaluation_type)
    assert_response :success
  end

  test "should update project_evaluation_type" do
    patch project_evaluation_type_url(@project_evaluation_type), params: { project_evaluation_type: { name: @project_evaluation_type.name } }
    assert_redirected_to project_evaluation_type_url(@project_evaluation_type)
  end

  test "should destroy project_evaluation_type" do
    assert_difference('ProjectEvaluationType.count', -1) do
      delete project_evaluation_type_url(@project_evaluation_type)
    end

    assert_redirected_to project_evaluation_types_url
  end
end
