class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :rating
      t.text :review
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
