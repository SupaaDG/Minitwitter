class RemoveTweetamountFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :tweetamount
  end
end
