# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:without_comments)
    @title = 'Test title'
    @body = 'Test body'
    @body2 = 'Updated body'
  end

  test 'should visit index' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'create post' do
    visit posts_url

    click_on 'New Post'

    fill_in 'Title', with: @title
    fill_in 'Body', with: @body

    click_on 'Create Post'
    assert_text 'Post was successfully created'

    post = Post.find_by(title: @title, body: @body)
    assert { post.present? }
  end

  test 'update post' do
    visit posts_url

    click_on 'Edit', match: :first

    fill_in 'Body', with: @updated_body

    click_on 'Update Post'

    assert_text 'Post was successfully updated'
  end

  test 'destroy post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
# END
