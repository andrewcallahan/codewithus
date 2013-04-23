class Hackathon < ActiveRecord::Base
  attr_accessible :capacity, :description, :end, :image, :image_content_type, :image_file_name, :location, :name, :price, :start

  has_many :participants
  has_many :users, :through => :participants
  has_many :teams

  accepts_nested_attributes_for :teams

  has_attached_file :image, :default_url => "avatar.jpg"
  validates_attachment_presence :image unless :image
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  def user_participating?(user)
    true if self.teams.any? { |team| team.teammates.any? { |teammate| teammate.user_id == user.id }}
  end

  def participating_users
    self.teams.collect { |team| team.teammates }.flatten.collect { |teammate| teammate.user_id }.uniq
  end

  def potential_teammates
    User.all.collect { |user| user.id } - self.participating_users
  end

  def load_potential_teammates(user)
    self.potential_teammates.collect { |id| User.find(id) } - [user]
  end

end
