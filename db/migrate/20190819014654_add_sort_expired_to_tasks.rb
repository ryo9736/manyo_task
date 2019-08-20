class AddSortExpiredToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :sort_expired, :datetime, default: Time.zone.now
  end
end
