class RemoveBookFromRecord < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :book_id, :integer
  end
end
