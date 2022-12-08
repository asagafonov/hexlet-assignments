require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @post = posts(:one)
  end

  test "should get new" do
    get new_post_comment_url(@post)
    assert_response :success
  end

  # test "should create comment" do
  #   assert_difference("Comment.count") do
  #     post new_post_comment_path(@post), params: { comment: { body: @comment.body, post_id: @comment.post_id } }
  #   end

  #   assert_redirected_to comment_url(Comment.last)
  # end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { body: @comment.body, post_id: @comment.post_id } }
    assert_redirected_to posts_url
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to posts_url
  end
end
