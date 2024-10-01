class CreateTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :texts do |t|
      t.text :text
      t.string :author
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
