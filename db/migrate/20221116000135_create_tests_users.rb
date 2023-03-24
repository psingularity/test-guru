# frozen_string_literal: true

class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :test, foreign_key: { to_table: :tests }

      t.timestamps
    end
  end
end
