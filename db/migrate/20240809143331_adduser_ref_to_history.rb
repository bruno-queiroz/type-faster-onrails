class AdduserRefToHistory < ActiveRecord::Migration[7.1]
  def change
    add_reference :histories, :user, foreign_key: true
  end
end
