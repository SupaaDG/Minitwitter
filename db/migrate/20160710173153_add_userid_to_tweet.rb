class AddUseridToTweet < ActiveRecord::Migration[5.0]
  def change
    add_reference :tweets, :user, forgeign_key: true
  end
end
