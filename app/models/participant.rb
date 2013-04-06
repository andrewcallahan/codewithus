class Participant < ActiveRecord::Base
  attr_accessible :hackathon_id, :user_id

  belongs_to :user
  belongs_to :hackathon
end
