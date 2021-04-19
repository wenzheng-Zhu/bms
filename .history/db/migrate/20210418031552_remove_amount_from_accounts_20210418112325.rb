class RemoveAmountFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :part_number, :string
  end
end
