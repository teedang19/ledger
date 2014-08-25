class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :name
      t.float :balance
      t.string :type
      t.string :context
      t.timestamps
    end
  end
end
