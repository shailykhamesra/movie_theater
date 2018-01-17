class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|
      t.integer :number
      t.references :theater, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
    end
  end
end
