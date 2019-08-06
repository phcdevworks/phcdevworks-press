require "application_system_test_case"

module PhcdevworksCmsPress
  class Article::PostsTest < ApplicationSystemTestCase
    setup do
      @article_post = phcdevworks_cms_press_article_posts(:one)
    end

    test "visiting the index" do
      visit article_posts_url
      assert_selector "h1", text: "Article/Posts"
    end

    test "creating a Post" do
      visit article_posts_url
      click_on "New Article/Post"

      fill_in "Post image", with: @article_post.post_image
      fill_in "Post status", with: @article_post.post_status
      fill_in "Post text", with: @article_post.post_text
      fill_in "Post title", with: @article_post.post_title
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit article_posts_url
      click_on "Edit", match: :first

      fill_in "Post image", with: @article_post.post_image
      fill_in "Post status", with: @article_post.post_status
      fill_in "Post text", with: @article_post.post_text
      fill_in "Post title", with: @article_post.post_title
      click_on "Update Post"

      assert_text "Post was successfully updated"
      click_on "Back"
    end

    test "destroying a Post" do
      visit article_posts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Post was successfully destroyed"
    end
  end
end
