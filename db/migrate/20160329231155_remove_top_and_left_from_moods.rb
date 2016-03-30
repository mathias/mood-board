class RemoveTopAndLeftFromMoods < ActiveRecord::Migration
  def change
    remove_column :moods, :top, :integer
    remove_column :moods, :left, :integer
  end
end
