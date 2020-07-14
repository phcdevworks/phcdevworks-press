require "application_system_test_case"

module PhcdevworksPress
  class List::PostsTest < ApplicationSystemTestCase
    setup do
      @list_post = phcdevworks_press_list_posts(:one)
    end

    test "visiting the index" do
      visit list_posts_url
      assert_selector "h1", text: "List/Posts"
    end

    test "creating a Post" do
      visit list_posts_url
      click_on "New List/Post"

      fill_in "List title", with: @list_post.list_title
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit list_posts_url
      click_on "Edit", match: :first

      fill_in "List title", with: @list_post.list_title
      click_on "Update Post"

      assert_text "Post was successfully updated"
      click_on "Back"
    end

    test "destroying a Post" do
      visit list_posts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Post was successfully destroyed"
    end
  end
end
