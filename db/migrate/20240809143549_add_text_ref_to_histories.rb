class AddTextRefToHistories < ActiveRecord::Migration[7.1]
  def change
    add_reference :histories, :text, null: false, foreign_key: true
  end
end
