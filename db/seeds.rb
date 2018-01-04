# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_script = Script.create(name: "YWoodcutter",
              skill: "Woodcutting",
              bot_for: "TRiBot",
              game_for: "Oldschool Runescape 07")


test_commit_1 = Commit.new(task: "Logs Cut",
                              runtime: "5")
test_commit_2 = Commit.new(task: "Oak Cut",
                              runtime: "10")

test_script.commits << test_commit_1
test_script.commits << test_commit_2
