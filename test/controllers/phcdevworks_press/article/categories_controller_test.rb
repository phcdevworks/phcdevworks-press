require 'test_helper'

module PhcdevworksPress
  class Article::CategoriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @article_category = phcdevworks_press_article_categories(:one)
    end

    test "should get index" do
      get article_categories_url
      assert_response :success
    end

    test "should get new" do
      get new_article_category_url
      assert_response :success
    end

    test "should create article_category" do
      assert_difference('Article::Category.count') do
        post article_categories_url, params: { article_category: {  } }
      end

      assert_redirected_to article_category_url(Article::Category.last)
    end

    test "should show article_category" do
      get article_category_url(@article_category)
      assert_response :success
    end

    test "should get edit" do
      get edit_article_category_url(@article_category)
      assert_response :success
    end

    test "should update article_category" do
      patch article_category_url(@article_category), params: { article_category: {  } }
      assert_redirected_to article_category_url(@article_category)
    end

    test "should destroy article_category" do
      assert_difference('Article::Category.count', -1) do
        delete article_category_url(@article_category)
      end

      assert_redirected_to article_categories_url
    end
  end
end
