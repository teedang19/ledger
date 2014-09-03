class AddAcctClassificationToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_classification, :string
  end
end
