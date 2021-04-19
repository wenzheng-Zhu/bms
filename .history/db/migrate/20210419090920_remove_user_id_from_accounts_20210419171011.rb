class RemoveUserIdFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :book_id, :integer
    remove_index :acc
  end
end
