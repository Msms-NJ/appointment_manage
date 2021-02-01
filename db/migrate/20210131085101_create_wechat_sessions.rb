class CreateWechatSessions < ActiveRecord::Migration[6.1]
  def change

    enable_extension 'hstore' unless extension_enabled?('hstore')
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    enable_extension 'plpgsql' unless extension_enabled?('plpgsql')
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')

    create_table :wechat_sessions do |t|
      t.string :openid, null: false
      t.hstore :hash_store
      t.timestamps null: false
    end
    add_index :wechat_sessions, :openid, unique: true
  end
end
