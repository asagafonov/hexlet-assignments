require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true

  test 'index page is displayed correctly' do
    get tasks_url
    assert_response :success
  end
end
