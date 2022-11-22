require 'rails_helper'

RSpec.describe '/groups', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @group = FactoryBot.create(:group, user: @user)
    @group1 = FactoryBot.build(:group, user: @user)
    sign_in @user
  end

  describe 'GET /index' do
    before(:each) do
      get groups_url
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('All Categories')
      expect(response.body).to include @group.name
      expect(response.body).to include @group.icon
    end
  end

  describe 'GET /new' do
    it 'render new page' do
      get new_group_url
      expect(response).to render_template(:new)
    end
  end
end
