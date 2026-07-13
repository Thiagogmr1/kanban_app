class Board < ApplicationRecord
  has_many :lists, dependent: :destroy

  after_create :create_default_lists

  private

  def create_default_lists
    [ "A Fazer", "Fazendo", "Concluído" ].each do |name|
      lists.create!(name: name)
    end
  end
end
