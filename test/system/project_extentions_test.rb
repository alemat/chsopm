require "application_system_test_case"

class ProjectExtentionsTest < ApplicationSystemTestCase
  setup do
    @project_extention = project_extentions(:one)
  end

  test "visiting the index" do
    visit project_extentions_url
    assert_selector "h1", text: "Project Extentions"
  end

  test "creating a Project extention" do
    visit project_extentions_url
    click_on "New Project Extention"

    fill_in "Activity Change", with: @project_extention.activity_change
    fill_in "Approval Status", with: @project_extention.approval_status
    fill_in "Budget Change", with: @project_extention.budget_change
    fill_in "Ia Change", with: @project_extention.ia_change
    fill_in "Project", with: @project_extention.project_id
    fill_in "Subject", with: @project_extention.subject
    fill_in "Within Project Duration", with: @project_extention.within_project_duration
    click_on "Create Project extention"

    assert_text "Project extention was successfully created"
    click_on "Back"
  end

  test "updating a Project extention" do
    visit project_extentions_url
    click_on "Edit", match: :first

    fill_in "Activity Change", with: @project_extention.activity_change
    fill_in "Approval Status", with: @project_extention.approval_status
    fill_in "Budget Change", with: @project_extention.budget_change
    fill_in "Ia Change", with: @project_extention.ia_change
    fill_in "Project", with: @project_extention.project_id
    fill_in "Subject", with: @project_extention.subject
    fill_in "Within Project Duration", with: @project_extention.within_project_duration
    click_on "Update Project extention"

    assert_text "Project extention was successfully updated"
    click_on "Back"
  end

  test "destroying a Project extention" do
    visit project_extentions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project extention was successfully destroyed"
  end
end
