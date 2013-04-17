class Teammate < ActiveRecord::Base

  attr_accessible :team_id, :user_id
  before_save

  belongs_to :user
  belongs_to :team

end