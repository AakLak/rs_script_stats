# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



admin = User.create!(
  email: 'a@a.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin'
)

script = Script.create!(
  name: 'YWoodcutter',
  skill: 'Woodcutting',
  bot_for: 'TRiBot',
  game_for: "Oldschool Runescape 07",
  user_id: 1
)


user = User.create!(
  email: 'b@b.com',
  password: 'useruser',
  password_confirmation: 'useruser'
)

user_commmit_1 = Commit.create!(
  runtime: 75,
  user_id: user.id,
  script_id: script.id
  )

commit_1_stat_1 = Stat.create(
  task: "Trees Chopped",
  amount: 56,
  commit_id: user_commmit_1.id
  )
# admin = User.create!([
#   {email: 'b@b.com'},
#   {password: 'useruser'},
#   {password_confirmation: 'useruser'}
# ])



# commit_1 = Commit.new(task: "Logs Cut",
#                               runtime: "5")
# commit_2 = Commit.new(task: "Oak Cut",
#                               runtime: "10")
#
# script.commits << commit_1
# script.commits << commit_2
