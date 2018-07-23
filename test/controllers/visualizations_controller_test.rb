require 'test_helper'

class VisualizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get visualizations_index_url
    assert_response :success
  end

end
