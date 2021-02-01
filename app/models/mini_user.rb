class MiniUser < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  class << self

    def get_by_openid(openid)
      tmp = self.find_by({openid: openid})
      tmp = self.create({openid: openid, uid: Base64.encode64(openid)}) if tmp.nil?
      tmp
    end

  end


end
