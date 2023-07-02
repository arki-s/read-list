class AddCompleteToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :complete, :boolean, default: false
  end
end
