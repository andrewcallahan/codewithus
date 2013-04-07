module FacebookHelper

  def facebook_pic
     current_user.identities.where(:provider => 'facebook').first.image if current_user.has_identity?
  end

end
