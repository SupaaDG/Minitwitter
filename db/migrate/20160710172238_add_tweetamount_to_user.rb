class AddTweetamountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tweetamount, :integer
  end
end
