require "test_helper"

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
    @list = lists(:one)
    @board = boards(:one)
  end

  test "should create card" do
    assert_difference("Card.count") do
      post board_list_cards_url(@board, @list), params: {
        card: {
          title: "Novo Card"
        }
      }
    end

    assert_redirected_to board_url(@board)
  end

  test "should destroy card" do
    assert_difference("Card.count", -1) do
      delete board_list_card_url(@board, @list, @card)
    end

    assert_redirected_to board_url(@board)
  end
end