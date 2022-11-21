require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should have valid attributes' do
    user = FactoryBot.build(:user)
    it 'should have a valid email' do
      expect(user).to be_valid
    end
  end
end
