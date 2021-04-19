class RemoveUserIdFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :book_id, :integer
    remove_index :accounts, name: "index_accounts_on_book_id_and_user_id"
  end
end
