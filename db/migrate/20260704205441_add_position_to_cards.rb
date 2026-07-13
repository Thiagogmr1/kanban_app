class AddPositionToCards < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :position, :integer, null: false, default: 0
  end
end
