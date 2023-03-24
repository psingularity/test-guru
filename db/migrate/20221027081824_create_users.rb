# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :email, null: false
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
