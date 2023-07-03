class AddUseridToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :user, type: :integer, null: false, foreign_key: true
  end
end
