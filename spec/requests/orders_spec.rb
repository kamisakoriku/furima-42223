require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /items/:item_id/orders' do
    it 'redirects to the login page if not signed in' do
      item = FactoryBot.create(:item)

      get item_orders_path(item)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
