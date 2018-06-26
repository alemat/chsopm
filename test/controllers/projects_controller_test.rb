require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { admin_budget: @project.admin_budget, direct_beneficiaries: @project.direct_beneficiaries, email: @project.email, end_date: @project.end_date, end_term_evaluation_date: @project.end_term_evaluation_date, focus_area_id: @project.focus_area_id, funding_status_id: @project.funding_status_id, indirect_beneficiaries: @project.indirect_beneficiaries, institution_id: @project.institution_id, mid_term_evaluation_date: @project.mid_term_evaluation_date, phone_number: @project.phone_number, program_budget: @project.program_budget, project_details: @project.project_details, project_focal_person: @project.project_focal_person, project_status_id: @project.project_status_id, project_title: @project.project_title, reporting_type_id: @project.reporting_type_id, start_date: @project.start_date, sub_focus_area_id: @project.sub_focus_area_id, total_budget: @project.total_budget } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { admin_budget: @project.admin_budget, direct_beneficiaries: @project.direct_beneficiaries, email: @project.email, end_date: @project.end_date, end_term_evaluation_date: @project.end_term_evaluation_date, focus_area_id: @project.focus_area_id, funding_status_id: @project.funding_status_id, indirect_beneficiaries: @project.indirect_beneficiaries, institution_id: @project.institution_id, mid_term_evaluation_date: @project.mid_term_evaluation_date, phone_number: @project.phone_number, program_budget: @project.program_budget, project_details: @project.project_details, project_focal_person: @project.project_focal_person, project_status_id: @project.project_status_id, project_title: @project.project_title, reporting_type_id: @project.reporting_type_id, start_date: @project.start_date, sub_focus_area_id: @project.sub_focus_area_id, total_budget: @project.total_budget } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
