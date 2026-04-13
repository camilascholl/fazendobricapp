class RemoveMembersFromApplication < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :ads, :members
    remove_index :ads, :member_id
    remove_column :ads, :member_id, :integer

    drop_table :members do |t|
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.index :email, unique: true
      t.index :reset_password_token, unique: true
    end
  end
end
