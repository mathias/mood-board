class AddLatestMoodIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :latest_mood_id, :integer
  end
end
