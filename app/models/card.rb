class Card < ApplicationRecord
  belongs_to :list

  before_create :set_position

  private

  def set_position
    self.position = list.cards.maximum(:position).to_i + 1
  end
end
