class CreateTransactionOnAccounts < ActiveRecord::Migration
  def change
    create_table :transaction_on_accounts do |t|
      t.references :account, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.float :value
      t.string :reason
      t.datetime :date

      t.timestamps null: false
    end
  end
end
