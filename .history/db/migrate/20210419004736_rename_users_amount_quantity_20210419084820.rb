class RenameUsersAmountQuantity < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :amount, :quan
  end
end
