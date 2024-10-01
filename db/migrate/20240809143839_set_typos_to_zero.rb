class SetTyposToZero < ActiveRecord::Migration[7.1]
  def change
    change_column_default :histories, :typos, from: nil, to: 0
  end
end
