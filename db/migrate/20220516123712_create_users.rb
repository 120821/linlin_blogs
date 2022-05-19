# frozen_string_literal: true
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## rememberable
      t.datetime :remember_created_at

      # trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # only if using reconfirmable

      # lockable
      t.integer  :failed_attempts, default: 0, null: false # only if lock strategy is :failed_attempts
      t.string   :unlock_token # only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :managers, :confirmation_token,   unique: true
    # add_index :managers, :unlock_token,         unique: true
  end
end
