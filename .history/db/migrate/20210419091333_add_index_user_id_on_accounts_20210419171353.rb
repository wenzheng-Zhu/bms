class AddIndexUserIdOnAccounts < ActiveRecord::Migration[6.1]
  def change
    add_index :accounts, [:user]
  end
end
