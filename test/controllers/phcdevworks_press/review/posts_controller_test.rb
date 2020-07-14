require 'test_helper'

module PhcdevworksPress
  class Review::PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @review_post = phcdevworks_press_review_posts(:one)
    end

    test "should get index" do
      get review_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_review_post_url
      assert_response :success
    end

    test "should create review_post" do
      assert_difference('Review::Post.count') do
        post review_posts_url, params: { review_post: { post_title: @review_post.post_title } }
      end

      assert_redirected_to review_post_url(Review::Post.last)
    end

    test "should show review_post" do
      get review_post_url(@review_post)
      assert_response :success
    end

    test "should get edit" do
      get edit_review_post_url(@review_post)
      assert_response :success
    end

    test "should update review_post" do
      patch review_post_url(@review_post), params: { review_post: { post_title: @review_post.post_title } }
      assert_redirected_to review_post_url(@review_post)
    end

    test "should destroy review_post" do
      assert_difference('Review::Post.count', -1) do
        delete review_post_url(@review_post)
      end

      assert_redirected_to review_posts_url
    end
  end
end
