class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.decimal :balance
      t.integer :book_id
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
    add_index :accounts, [:book_id, :user_id, ]
  end
end
