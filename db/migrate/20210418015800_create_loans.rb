class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :account_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :loans, :account_id
  end
end
