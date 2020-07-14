require "application_system_test_case"

module PhcdevworksPress
  class Review::PostsTest < ApplicationSystemTestCase
    setup do
      @review_post = phcdevworks_press_review_posts(:one)
    end

    test "visiting the index" do
      visit review_posts_url
      assert_selector "h1", text: "Review/Posts"
    end

    test "creating a Post" do
      visit review_posts_url
      click_on "New Review/Post"

      fill_in "Post title", with: @review_post.post_title
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit review_posts_url
      click_on "Edit", match: :first

      fill_in "Post title", with: @review_post.post_title
      click_on "Update Post"

      assert_text "Post was successfully updated"
      click_on "Back"
    end

    test "destroying a Post" do
      visit review_posts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Post was successfully destroyed"
    end
  end
end
