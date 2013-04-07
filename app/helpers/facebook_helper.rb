module FacebookHelper

  def facebook_pic
     @user.identities.where(:provider => 'facebook').first.image
  end

end
