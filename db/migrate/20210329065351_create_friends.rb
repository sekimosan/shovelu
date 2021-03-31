class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :user,foreign_key: true
      t.references :follow, foreign_key: {to_table: :users}
      t.timestamps
      t.index [:user_id,:follow_id], unique: true
    end
  end
end