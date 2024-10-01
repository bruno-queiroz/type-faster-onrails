class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.integer :cpm
      t.integer :typos

      t.timestamps
    end
  end
end
