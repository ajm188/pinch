require 'rails_helper'

RSpec.describe NonProfit, type: :model do
  describe 'asosciations' do
    it { should have_many :events }
  end
end
