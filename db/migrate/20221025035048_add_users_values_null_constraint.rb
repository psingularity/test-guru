class AddUsersValuesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :age, false)
    change_column_null(:users, :email, false)
    change_column_default(:users, :score, 0)
  end
end
