require "application_system_test_case"

module PhcdevworksPress
  class List::ItemsTest < ApplicationSystemTestCase
    setup do
      @list_item = phcdevworks_press_list_items(:one)
    end

    test "visiting the index" do
      visit list_items_url
      assert_selector "h1", text: "List/Items"
    end

    test "creating a Item" do
      visit list_items_url
      click_on "New List/Item"

      fill_in "Item title", with: @list_item.item_title
      click_on "Create Item"

      assert_text "Item was successfully created"
      click_on "Back"
    end

    test "updating a Item" do
      visit list_items_url
      click_on "Edit", match: :first

      fill_in "Item title", with: @list_item.item_title
      click_on "Update Item"

      assert_text "Item was successfully updated"
      click_on "Back"
    end

    test "destroying a Item" do
      visit list_items_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Item was successfully destroyed"
    end
  end
end
