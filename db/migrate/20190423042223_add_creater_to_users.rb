class AddCreaterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :creator_id, :bigint
  end
end
