class AddBookingsToRecord < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :meeting, type: :integer, null: false, foreign_key: true
  end
end
