class CreateMiniUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :mini_users, id: :uuid do |t|
      ## Required
      t.string :openid,   null: false, default: ""
      t.string :provider, null: false, default: "wechat"
      t.string :uid, null: false, default: ""

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, default: false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      # User Info
      t.string :nick_name
      t.integer :gender
      t.string :province
      t.string :country
      t.string :avatar_url
      t.string :unionid
      t.string :language
      t.string :session_key

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :mini_users, :openid, unique: true
    add_index :mini_users, :reset_password_token, unique: true
    add_index :mini_users, :confirmation_token, unique: true

  end
end
