class AddActivatedAndActivationCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activated, :boolean, default: false, null: false
    add_column :users, :activation_code, :string
  end
end
