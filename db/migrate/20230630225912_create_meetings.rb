class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
