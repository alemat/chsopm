require "application_system_test_case"

class PerformanceReportsTest < ApplicationSystemTestCase
  setup do
    @performance_report = performance_reports(:one)
  end

  test "visiting the index" do
    visit performance_reports_url
    assert_selector "h1", text: "Performance Reports"
  end

  test "creating a Performance report" do
    visit performance_reports_url
    click_on "New Performance Report"

    fill_in "Project", with: @performance_report.project_id
    fill_in "Remark", with: @performance_report.remark
    fill_in "Reporting Type", with: @performance_report.reporting_type_id
    click_on "Create Performance report"

    assert_text "Performance report was successfully created"
    click_on "Back"
  end

  test "updating a Performance report" do
    visit performance_reports_url
    click_on "Edit", match: :first

    fill_in "Project", with: @performance_report.project_id
    fill_in "Remark", with: @performance_report.remark
    fill_in "Reporting Type", with: @performance_report.reporting_type_id
    click_on "Update Performance report"

    assert_text "Performance report was successfully updated"
    click_on "Back"
  end

  test "destroying a Performance report" do
    visit performance_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Performance report was successfully destroyed"
  end
end
