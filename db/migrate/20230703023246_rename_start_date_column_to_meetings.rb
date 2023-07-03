class RenameStartDateColumnToMeetings < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :start_date, :start_time
    rename_column :meetings, :end_date, :end_time
  end
end
