class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :sn
      t.string :state
      t.integer :loan_id

      t.timestamps
    end
    add_index :books, [:loan_id, :title, :sn]
  end
end
