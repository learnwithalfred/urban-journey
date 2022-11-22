require 'rails_helper'
RSpec.describe '/entities', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    @entity = FactoryBot.create(:entity, user: @user, group: @group)

    sign_in @user
  end

  describe 'GET /index' do
    before(:each) do
      get group_entities_path(@group)
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Category Entities')
      expect(response.body).to include @group.name
      expect(response.body).to include @group.icon
      expect(response.body).to include @entity.name
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_entity_path(@group)
      expect(response).to be_successful
    end
  end
end
