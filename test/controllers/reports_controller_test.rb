require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get project_report" do
    get reports_project_report_url
    assert_response :success
  end

end
