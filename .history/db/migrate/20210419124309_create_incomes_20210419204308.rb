class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.integer :book_id
      t.decimal :amount
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
