# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

userID_1 = User.create!(
  email: 'u1@u1.com',
  password: 'useruser',
  password_confirmation: 'useruser'
)

userID_2 = User.create!(
  email: 'u2@u2.com',
  password: 'useruser',
  password_confirmation: 'useruser'
)

userID_3 = User.create!(
  email: 'u3@u3.com',
  password: 'useruser',
  password_confirmation: 'useruser'
)

admin = User.create!(
  email: 'a@a.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin',
  admin: true
)


script_1 = Script.create!(
  name: 'YWoodcutter',
  skill: 'Woodcutting',
  bot_for: 'TRiBot',
  game_for: "Oldschool Runescape 07",
  user_id: admin.id
)

script_2 = Script.create!(
  name: 'Encoded Fisher',
  skill: 'Fishing',
  bot_for: 'TRiBot',
  game_for: "Oldschool Runescape 07",
  user_id: admin.id
)

trees = %w(logs\ cut oaks\ cut willows\ cut teaks\ cut maples\ cut mahogoany\ cut yew\ cut magic\ cut)
300.times do |i|
  Commit.create!(
    runtime: rand(240)+20,
    user_id: rand(3)+1,
    script_id: script_1.id,
    created_at: DateTime.parse((Time.now - rand(1209600)).to_s)
    )
    Stat.create(
      task: trees.sample,
      amount: 28 * (rand(5)+1),
      commit_id: i + 1
      )
    if (rand(256) + 1) == 1
      Stat.create(
        task: "Nests",
        amount: 1,
        commit_id: i + 1
        )
    end
end

fish = %w(shrimp\ caught anchovies\ caught trout\ caught salmon\ caught tuna\ caught lobster\ caught swordfish\ caught monkfish\ caught)
300.times do |i|
  Commit.create!(
    runtime: rand(240)+20,
    user_id: rand(3)+1,
    script_id: script_2.id,
    created_at: DateTime.parse((Time.now - rand(1209600)).to_s)
    )
    Stat.create(
      task: fish.sample,
      amount: 28 * (rand(5)+1),
      commit_id: 300 + i + 1
      )
end


# user_commmit_1 = Commit.create!(
#   runtime: 75,
#   user_id: user.id,
#   script_id: script.id
#   )

# commit_1_stat_1 = Stat.create(
#   task: "Trees Chopped",
#   amount: 56,
#   commit_id: user_commmit_1.id
#   )
#
# commit_1_stat_2 = Stat.create(
#   task: "Nests Collected",
#   amount: 1,
#   commit_id: user_commmit_1.id
#   )
