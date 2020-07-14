require 'test_helper'

module PhcdevworksPress
  class List::ItemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @list_item = phcdevworks_press_list_items(:one)
    end

    test "should get index" do
      get list_items_url
      assert_response :success
    end

    test "should get new" do
      get new_list_item_url
      assert_response :success
    end

    test "should create list_item" do
      assert_difference('List::Item.count') do
        post list_items_url, params: { list_item: { item_title: @list_item.item_title } }
      end

      assert_redirected_to list_item_url(List::Item.last)
    end

    test "should show list_item" do
      get list_item_url(@list_item)
      assert_response :success
    end

    test "should get edit" do
      get edit_list_item_url(@list_item)
      assert_response :success
    end

    test "should update list_item" do
      patch list_item_url(@list_item), params: { list_item: { item_title: @list_item.item_title } }
      assert_redirected_to list_item_url(@list_item)
    end

    test "should destroy list_item" do
      assert_difference('List::Item.count', -1) do
        delete list_item_url(@list_item)
      end

      assert_redirected_to list_items_url
    end
  end
end
