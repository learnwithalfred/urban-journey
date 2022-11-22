require 'rails_helper'

RSpec.describe User, type: :model do
  # test associations
  describe 'associations' do
    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_many
    end

    it 'has many entities' do
      association = described_class.reflect_on_association(:entities)
      expect(association.macro).to eq :has_many
    end
  end

  # test validations

  describe 'user should have valid attributes' do
    user = FactoryBot.build(:user)
    it 'should have a valid email' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it 'should have a valid password' do
      user = FactoryBot.build(:user, password: nil)

      expect(user).to_not be_valid
    end

    it 'should have a valid password confirmation' do
      user = FactoryBot.build(:user, password_confirmation: nil)

      expect(user).to_not be_valid
    end

    it 'password should match password confirmation' do
      user = FactoryBot.build(:user, password: '123456', password_confirmation: 'XXXXXX')

      expect(user).to_not be_valid
    end
  end
end
