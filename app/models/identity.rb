class Identity < ActiveRecord::Base
  attr_accessible :asecret, :atoken, :provider, :uid, :user_id, :token_expires_at

  belongs_to :user
end
