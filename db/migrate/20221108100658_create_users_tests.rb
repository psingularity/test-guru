class CreateUsersTests < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tests do |t|
      t.references :user_id, foreign_key: { to_table: :users }
      t.references :test_id, foreign_key: { to_table: :tests }

      t.timestamps
    end
  end
end
