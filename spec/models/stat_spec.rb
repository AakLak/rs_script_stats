require 'rails_helper'

RSpec.describe Stat, type: :model do
  it { should belong_to(:commit) }

  let!(:user1) do
    User.create!(
      email: 'ueferfrfrf@u1.com',
      password: 'useruser',
      password_confirmation: 'useruser'
    )
  end

  let!(:script1) do
    Script.create!(
      name: 'YWoodcutter',
      skill: 'Woodcutting',
      bot_for: 'TRiBot',
      game_for: 'Oldschool Runescape 07',
      user_id: user1.id
    )
  end

  let!(:commit1) do
    Commit.create!(
      runtime: 60,
      user_id: user1.id,
      script_id: script1.id,
      created_at: DateTime.parse(Time.now.to_s)
    )
  end

  let!(:lower_stat) do
    Stat.create!(
      task: 'Lower Stat',
      amount: 1,
      commit_id: commit1.id
    )
  end

  let!(:higher_stat) do
    Stat.create!(
    task: 'Higher Stat',
    amount: 2,
    commit_id: commit1.id
  )
end

  describe "top_5 method" do
    it 'returns correctly ordered stats' do
      expect(Stat.top_5).to start_with(["Higher Stat", 2.0]).and end_with(["Lower Stat", 1.0])
    end
  end

end
