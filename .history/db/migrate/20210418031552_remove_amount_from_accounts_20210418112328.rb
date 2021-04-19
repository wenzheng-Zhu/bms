class RemoveAmountFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :amount, :string
  end
end
