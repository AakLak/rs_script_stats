require 'rails_helper'

RSpec.describe Commit, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:script) }
end
