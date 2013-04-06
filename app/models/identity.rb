class Identity < ActiveRecord::Base
  attr_accessible :asecret, :atoken, :provider, :uid, :user_id
end
