require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
    @board = boards(:one)
  end

  test "should create list" do
    assert_difference("List.count") do
      post board_lists_url(@board), params: {
        list: {
          name: "Nova Lista"
        }
      }
    end

    assert_redirected_to board_url(@board)
  end

  test "should destroy list" do
    assert_difference("List.count", -1) do
      delete board_list_url(@board, @list)
    end
  end
end
