require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true

  test 'index page is displayed correctly' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'show page is displayed correctly' do
    bulletin = bulletins(:bulletin_1)
    get bulletin_url(bulletin)
    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select 'p', 'Description 1'
  end
end
