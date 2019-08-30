class RenameSortExpiredColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :sort_expired, :expired
  end
end
