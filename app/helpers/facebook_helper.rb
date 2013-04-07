module FacebookHelper

  def facebook_pic
     current_user.identities.where(:provider => 'facebook').first.image
  end

end
