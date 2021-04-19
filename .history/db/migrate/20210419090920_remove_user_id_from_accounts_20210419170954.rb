class RemoveUserIdFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :book_id, :integer
    remove
  end
end
