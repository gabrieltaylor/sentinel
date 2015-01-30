class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.timestamps
    end
    add_reference :users, :account, index: true
    add_reference :services, :account, index: true
    remove_reference :services, :user
  end
end
