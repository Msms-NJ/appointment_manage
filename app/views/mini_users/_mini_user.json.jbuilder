json.extract! mini_user, :id, :openid, :nick_name, :gender, :province, :country, :avatar_url, :unionid, :created_at, :updated_at
json.url mini_user_url(mini_user, format: :json)
