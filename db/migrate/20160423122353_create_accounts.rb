class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.boolean :notifications
      t.float :critic_value

      t.timestamps null: false
    end
  end
end
