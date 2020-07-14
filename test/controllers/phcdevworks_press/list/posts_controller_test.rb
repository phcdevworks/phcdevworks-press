require 'test_helper'

module PhcdevworksPress
  class List::PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @list_post = phcdevworks_press_list_posts(:one)
    end

    test "should get index" do
      get list_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_list_post_url
      assert_response :success
    end

    test "should create list_post" do
      assert_difference('List::Post.count') do
        post list_posts_url, params: { list_post: { list_title: @list_post.list_title } }
      end

      assert_redirected_to list_post_url(List::Post.last)
    end

    test "should show list_post" do
      get list_post_url(@list_post)
      assert_response :success
    end

    test "should get edit" do
      get edit_list_post_url(@list_post)
      assert_response :success
    end

    test "should update list_post" do
      patch list_post_url(@list_post), params: { list_post: { list_title: @list_post.list_title } }
      assert_redirected_to list_post_url(@list_post)
    end

    test "should destroy list_post" do
      assert_difference('List::Post.count', -1) do
        delete list_post_url(@list_post)
      end

      assert_redirected_to list_posts_url
    end
  end
end
