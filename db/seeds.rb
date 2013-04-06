# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create(name: "Andrew", email: "andrew.callahan@flatironschool.com", password: "password")
  u = User.last
  u.pic = File.open('db/seed_images/andrewcallahan.jpeg')
  u.save!
User.create(name: "Danny", email: "danny.olinsky@flatironschool.com", password: "password")
  u = User.last
  u.pic = File.open('db/seed_images/dannyheadshot2.jpg')
  u.save!
User.create(name: "Anthony", email: "anthony.wijnen@flatironschool.com", password: "password")
  u = User.last
  u.pic = File.open('db/seed_images/anthony_crop.jpg')
  u.save!

puts "Users Created"

# Skill Categories
Skillcategories.create(name: "Design")
Skillcategories.create(name: "Front End")
Skillcategories.create(name: "Back End")

# Skills
Skill.create(name: "Photoshop", skillcategory_id: 1)
Skill.create(name: "Illustrator", skillcategory_id: 1)
Skill.create(name: "Fireworks", skillcategory_id: 1)

Skill.create(name: "HTML", skillcategory_id: 2)
Skill.create(name: "CSS", skillcategory_id: 2)
Skill.create(name: "Javascript", skillcategory_id: 2)

Skill.create(name: "Ruby", skillcategory_id: 3)
Skill.create(name: "Rails", skillcategory_id: 3)
Skill.create(name: "Postgres", skillcategory_id: 3)


# User_Skillcatagories
UserSkillcategories.create(user_id: 1, skillcategory_id: 1, level: 1)
UserSkillcategories.create(user_id: 1, skillcategory_id: 1, level: 1)
UserSkillcategories.create(user_id: 1, skillcategory_id: 1, level: 2)

# User_Skills
UserSkills.create(user_id: 1, skill_id: 1, level: 2)
UserSkills.create(user_id: 1, skill_id: 2, level: 1)
UserSkills.create(user_id: 1, skill_id: 3, level: 1)

UserSkills.create(user_id: 1, skill_id: 4, level: 3)
UserSkills.create(user_id: 1, skill_id: 5, level: 3)
UserSkills.create(user_id: 1, skill_id: 6, level: 1)

UserSkills.create(user_id: 1, skill_id: 7, level: 2)
UserSkills.create(user_id: 1, skill_id: 8, level: 2)
UserSkills.create(user_id: 1, skill_id: 9, level: 1)

# Hackathons
Hacakathon.create(name: "Hack@Flatiron", location: "26 W 33rd St New York, NY", description: "The Flatiron School presents the first ever CodeWithUs Hackathon! We have space for 2 designers, 3 ruby noobs and 3 ruby experts. Join now before it fills up!", capacity: 8, price: 20)
  h = Hackathon.last
  h.pic = File.open('db/seed_images/flatiron-school.png')
  h.start = DateTime.new(2013,4,18,12,0,0)
  h.end = DateTime.new(2013,4,18,17,0,0)
  h.save!

# Participants
User.all.each do |user|
  Participants.create(user_id: user.id, hackathon_id: 1)
end
