require 'rails_helper'

RSpec.describe Group, type: :model do
  # test associations
  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many entities' do
      association = described_class.reflect_on_association(:entities)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    @user = FactoryBot.create(:user)
    group = FactoryBot.build(:group, user: @user)

    it 'is not valid without a name' do
      group = FactoryBot.build(:group, name: nil)
      expect(group).to_not be_valid
    end

    it 'is not valid without a icon' do
      group = FactoryBot.build(:group, icon: nil)
      expect(group).to_not be_valid
    end

    it 'is not valid without a user_id' do
      group = FactoryBot.build(:group, user: nil)
      expect(group).to_not be_valid
    end
  end
end
