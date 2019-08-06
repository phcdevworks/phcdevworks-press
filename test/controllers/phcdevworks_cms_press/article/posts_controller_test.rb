require 'test_helper'

module PhcdevworksCmsPress
  class Article::PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @article_post = phcdevworks_cms_press_article_posts(:one)
    end

    test "should get index" do
      get article_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_article_post_url
      assert_response :success
    end

    test "should create article_post" do
      assert_difference('Article::Post.count') do
        post article_posts_url, params: { article_post: { post_image: @article_post.post_image, post_status: @article_post.post_status, post_text: @article_post.post_text, post_title: @article_post.post_title } }
      end

      assert_redirected_to article_post_url(Article::Post.last)
    end

    test "should show article_post" do
      get article_post_url(@article_post)
      assert_response :success
    end

    test "should get edit" do
      get edit_article_post_url(@article_post)
      assert_response :success
    end

    test "should update article_post" do
      patch article_post_url(@article_post), params: { article_post: { post_image: @article_post.post_image, post_status: @article_post.post_status, post_text: @article_post.post_text, post_title: @article_post.post_title } }
      assert_redirected_to article_post_url(@article_post)
    end

    test "should destroy article_post" do
      assert_difference('Article::Post.count', -1) do
        delete article_post_url(@article_post)
      end

      assert_redirected_to article_posts_url
    end
  end
end
