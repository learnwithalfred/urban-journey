require 'rails_helper'

RSpec.describe Entity, type: :model do
  # test associations
  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    entity = FactoryBot.build(:entity, user: @user, group: @group)
    it 'is not valid without a name' do
      entity = FactoryBot.build(:entity, name: nil)
      expect(entity).to_not be_valid
    end

    it 'is not valid without a user_id' do
      entity = FactoryBot.build(:entity, user: nil)
      expect(entity).to_not be_valid
    end

    it 'is not valid without a group' do
      entity = FactoryBot.build(:entity, group: nil)
      expect(entity).to_not be_valid
    end
  end
end
