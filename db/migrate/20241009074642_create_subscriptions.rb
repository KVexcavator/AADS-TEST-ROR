class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.bigint :follower_id
      t.bigint :followed_id
      t.timestamps
    end
    
    add_index :subscriptions, :follower_id
    add_index :subscriptions, :followed_id
  end
end
