require 'rails_helper'

RSpec.describe Stat, type: :model do
  it { should belong_to(:commit) }

  userID_1 = User.create!(
    email: 'ufefefe2@u1.com',
    password: 'useruser',
    password_confirmation: 'useruser',
  )

  script1 = Script.create!(
    name: 'YWoodcutter',
    skill: 'Woodcutting',
    bot_for: 'TRiBot',
    game_for: 'Oldschool Runescape 07',
    user_id: userID_1.id
  )
  Commit.create!(
    runtime: 60,
    user_id: userID_1.id,
    script_id: script1.id,
    created_at: DateTime.parse(Time.now.to_s)
  )

  lower_stat = Stat.create!(
    task: 'Lower Stat',
    amount: 1,
    commit_id: 1
  )

  higher_stat = Stat.create!(
    task: 'Higher Stat',
    amount: 2,
    commit_id: 1
  )

  describe ".top_5" do
    it 'returns correctly ordered stats' do
      top_5_stats = Stat.top_5
      expect(top_5_stats).to start_with(["Higher Stat", 2.0]).and end_with(["Lower Stat", 1.0])
    end
  end

end
